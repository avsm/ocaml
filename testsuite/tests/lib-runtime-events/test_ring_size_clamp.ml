(* TEST
 include runtime_events;
 ocamlrunparam += ",d=64,e=40";
*)

(* Regression test for a size-arithmetic overflow in the runtime_events ring
   sizing. The ring exponent 'e' (OCAMLRUNPARAM) had no upper bound, so the
   byte size of the mapping -- max_domains * (1 << e) * sizeof(uint64_t) --
   overflowed the 'int' that holds it: with 'd=1', 'e=28' wrapped the size
   negative and aborted at startup, while 'e=29' truncated it to zero, giving
   an empty mapping that the producer then wrote out of bounds. In addition
   '1 << e' was itself undefined behaviour for large 'e'.

   caml_runtime_events_init now clamps 'e' down to the largest value whose
   ring fits the budget (keeping it a power of two) and warns on stderr. The
   clamp runs at startup, before any ring is created, so this test needs no
   running ring. With 'd=64' the requested 'e=40' is clamped to 'e=21',
   independently of the platform's default domain count. The warning is
   emitted on stderr and the program then runs to completion. *)

let () = print_string "program ran\n"
