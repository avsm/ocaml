let capitalize_ascii = String.capitalize_ascii

let bad_markup : ?suggestion:string -> string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ?suggestion -> Odoc_parser_warning.make ?suggestion "'%s': bad markup."

let leading_zero_in_heading_level : string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'%s': leading zero in heading level."

let should_not_be_empty : what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ~what -> Odoc_parser_warning.make "%s should not be empty." (capitalize_ascii what)

let markup_should_not_be_used : what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ~what ->
  Odoc_parser_warning.make "%s should not be used because it has no effect."
    (capitalize_ascii what)

let should_begin_on_its_own_line : what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ~what ->
  Odoc_parser_warning.make "%s should begin on its own line." (capitalize_ascii what)

let should_be_followed_by_whitespace : what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ~what ->
  Odoc_parser_warning.make "%s should be followed by space, a tab, or a new line."
    (capitalize_ascii what)

let not_allowed :
    ?suggestion:string -> what:string -> in_what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
    =
 fun ?suggestion ~what ~in_what ->
  Odoc_parser_warning.make ?suggestion "%s is not allowed in %s." (capitalize_ascii what)
    in_what

let unclosed_bracket :
    ?suggestion:string -> bracket:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ?suggestion ~bracket ->
  Odoc_parser_warning.make ?suggestion "Open bracket '%s' is never closed." bracket

let no_leading_whitespace_in_verbatim : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'{v' should be followed by whitespace."

let not_enough_indentation_in_code_block : what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t
    =
 fun ~what ->
  Odoc_parser_warning.make "%ss should be indented at the opening `{`."
    (String.capitalize_ascii what)

let no_trailing_whitespace_in_verbatim : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'v}' should be preceded by whitespace."

let stray_at : Odoc_parser_loc.span -> Odoc_parser_warning.t = Odoc_parser_warning.make "Stray '@'."

let stray_cr : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "Stray '\\r' (carriage return character)."

let truncated_before : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'@before' expects version number on the same line."

let truncated_param : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'@param' expects parameter name on the same line."

let truncated_raise : string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "'%s' expects exception constructor on the same line."

let truncated_see : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make
    "'@see' should be followed by <url>, 'file', or \"document title\"."

let truncated_string : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "Truncated string literal"

let unknown_tag : string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "Unknown tag '%s'."

let unpaired_right_brace : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make ~suggestion:"try '\\}'." "Unpaired '}' (end of markup)."

let unpaired_right_bracket : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make ~suggestion:"try '\\]'." "Unpaired ']' (end of code)."

let no_language_tag_in_meta : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make ~suggestion:"try '{[ ... ]}' or '{@ocaml[ ... ]}'."
    "'{@' should be followed by a language tag."

let language_tag_invalid_char lang_tag : char -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  let suggestion = "try '{@" ^ lang_tag ^ "[ ... ]}'." in
  Odoc_parser_warning.make ~suggestion "Invalid character '%c' in language tag."

let code_block_tag_invalid_char : char -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "Invalid character in code block metadata tag '%c'."

let invalid_char_code : int -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make "Invalid escape sequence '\\%d"

let truncated_code_block_meta : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make ~suggestion:"try '{@ocaml[ ... ]}'." "Missing end of code block."

let truncated_code_block : Odoc_parser_loc.span -> Odoc_parser_warning.t =
  Odoc_parser_warning.make ~suggestion:"add ']}'." "Missing end of code block."

let end_not_allowed : in_what:string -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun ~in_what ->
  Odoc_parser_warning.make ~suggestion:"add '}'." "End of text is not allowed in %s."
    in_what

let should_not_be_escaped : char -> Odoc_parser_loc.span -> Odoc_parser_warning.t =
 fun c ->
  Odoc_parser_warning.make ~suggestion:"Remove \\."
    "The '%c' character should not be escaped." c
