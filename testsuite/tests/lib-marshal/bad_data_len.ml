(* TEST
 arch64;
*)

(* Regression test for an unsigned wraparound in the marshal length check.

   The marshalling "big" header (magic 0x8495A6BF) carries a 64-bit data
   length read as an unbounded uintnat. *)

let () =
  let b = Bytes.create 64 in
  Bytes.set_int32_be b 0 0x8495A6BFl;   (* Intext_magic_number_big *)
  (* bytes 4-7: reserved (read and ignored) *)
  Bytes.set_int64_be b 8 (-32L);        (* data_len = 2^64 - 32 *)
  Bytes.set_int64_be b 16 0L;           (* num_objects *)
  Bytes.set_int64_be b 24 0L;           (* whsize *)
  (* body at byte 32: a CODE_STRING32 claiming a 1 GiB oob length *)
  Bytes.set_uint8 b 32 0x0A;            (* CODE_STRING32 *)
  Bytes.set_int32_be b 33 0x40000000l;  (* claimed length = 1 GiB *)
  match Marshal.from_bytes b 0 with
  | exception Failure msg -> Printf.printf "rejected: %s\n" msg
  | exception Invalid_argument msg -> Printf.printf "rejected: %s\n" msg
  | _ -> print_string "ERROR: malformed marshal data was accepted\n"
