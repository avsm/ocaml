(* TEST *)

(* Regression test: a domain's fiber stack cache must be freed when
   the domain terminates.  *)

open Effect
open Effect.Deep

type _ Effect.t += Ping : unit Effect.t

let rec churn_fibers depth =
  if depth > 0 then
    ignore (match_with
      (fun () -> perform Ping; churn_fibers (depth - 1); 0) ()
      { retc = Fun.id;
        exnc = raise;
        effc = (fun (type a) (e : a Effect.t) ->
          match e with
          | Ping -> Some (fun (k : (a, _) continuation) -> continue k ())
          | _ -> None) })

let churn_fibers () = churn_fibers 8

let live_stacks_words () =
  Gc.full_major ();
  (Gc.quick_stat ()).Gc.live_stacks_words

let () =
  churn_fibers ();
  for _ = 1 to 3 do
    Domain.join (Domain.spawn churn_fibers)
  done;
  let baseline = live_stacks_words () in
  let n_domains = 50 in
  for _ = 1 to n_domains do
    Domain.join (Domain.spawn churn_fibers)
  done;
  let growth = live_stacks_words () - baseline in
  if growth > n_domains * 8 then
    Printf.printf "stack cache leak: live_stacks_words grew by %d words\n"
      growth
  else
    print_endline "OK"
