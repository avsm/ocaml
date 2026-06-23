(* A lazy stream *)

type 'a t = {
  next : int -> 'a option;
  mutable buffer : 'a list;
  mutable produced : int;
  mutable ended : bool;
}

let from next = { next; buffer = []; produced = 0; ended = false }

let rec fill t n =
  if (not t.ended) && List.length t.buffer < n then
    match t.next t.produced with
    | Some x ->
        t.produced <- t.produced + 1;
        t.buffer <- t.buffer @ [ x ];
        fill t n
    | None -> t.ended <- true

let peek t =
  fill t 1;
  match t.buffer with x :: _ -> Some x | [] -> None

let junk t =
  fill t 1;
  match t.buffer with _ :: rest -> t.buffer <- rest | [] -> ()

let npeek n t =
  fill t n;
  let rec take k = function
    | x :: rest when k > 0 -> x :: take (k - 1) rest
    | _ -> []
  in
  take n t.buffer
