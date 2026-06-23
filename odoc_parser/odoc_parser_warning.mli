(* Interface generated with [ocamlc -i] for the in-tree build (compilerlibs requires every module to carry a .mli). *)

type t = { location : Odoc_parser_loc.span; message : string; }
val to_string : t -> string
val pp : Format.formatter -> t -> unit
val kasprintf :
  (string -> 'a) -> ('b, Format.formatter, unit, 'a) format4 -> 'b
val kmake :
  (string -> 'a) ->
  ?suggestion:string -> ('b, Format.formatter, unit, 'a) format4 -> 'b
val make :
  ?suggestion:string ->
  ('a, Format.formatter, unit, Odoc_parser_loc.span -> t) format4 -> 'a
