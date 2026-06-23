(* Internal module, not exposed *)

val parse :
  Odoc_parser_warning.t list ref ->
  Odoc_parser_token.t Odoc_parser_loc.with_location Odoc_parser_stream.t ->
  Odoc_parser_ast.t * Odoc_parser_warning.t list
