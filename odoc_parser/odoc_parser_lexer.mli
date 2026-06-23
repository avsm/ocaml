(* Internal module, not exposed *)

type input = {
  file : string;
  offset_to_location : int -> Odoc_parser_loc.point;
  warnings : Odoc_parser_warning.t list ref;
  lexbuf : Lexing.lexbuf;
  string_buffer : Buffer.t;
}

val token : input -> Lexing.lexbuf -> Odoc_parser_token.t Odoc_parser_loc.with_location
