(* Interface generated with [ocamlc -i] for the in-tree build (compilerlibs requires every module to carry a .mli). *)

val capitalize_ascii : string -> string
val bad_markup :
  ?suggestion:string ->
  string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val leading_zero_in_heading_level :
  string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val should_not_be_empty :
  what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val markup_should_not_be_used :
  what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val should_begin_on_its_own_line :
  what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val should_be_followed_by_whitespace :
  what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val not_allowed :
  ?suggestion:string ->
  what:string ->
  in_what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val unclosed_bracket :
  ?suggestion:string ->
  bracket:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val no_leading_whitespace_in_verbatim :
  Odoc_parser_loc.span -> Odoc_parser_warning.t
val not_enough_indentation_in_code_block :
  what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val no_trailing_whitespace_in_verbatim :
  Odoc_parser_loc.span -> Odoc_parser_warning.t
val stray_at : Odoc_parser_loc.span -> Odoc_parser_warning.t
val stray_cr : Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_before : Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_param : Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_raise : string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_see : Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_string : Odoc_parser_loc.span -> Odoc_parser_warning.t
val unknown_tag : string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val unpaired_right_brace : Odoc_parser_loc.span -> Odoc_parser_warning.t
val unpaired_right_bracket : Odoc_parser_loc.span -> Odoc_parser_warning.t
val no_language_tag_in_meta : Odoc_parser_loc.span -> Odoc_parser_warning.t
val language_tag_invalid_char :
  string -> char -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val code_block_tag_invalid_char :
  char -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val invalid_char_code : int -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_code_block_meta : Odoc_parser_loc.span -> Odoc_parser_warning.t
val truncated_code_block : Odoc_parser_loc.span -> Odoc_parser_warning.t
val end_not_allowed :
  in_what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
val should_not_be_escaped :
  char -> Odoc_parser_loc.span -> Odoc_parser_warning.t
