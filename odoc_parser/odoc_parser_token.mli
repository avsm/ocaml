(* Interface generated with [ocamlc -i] for the in-tree build (compilerlibs requires every module to carry a .mli). *)

type section_heading = [ `Begin_section_heading of int * string option ]
type style = [ `Bold | `Emphasis | `Italic | `Subscript | `Superscript ]
type paragraph_style = [ `Center | `Left | `Right ]
type tag =
    [ `Tag of
        [ `Author of string
        | `Before of string
        | `Canonical of string
        | `Children_order
        | `Closed
        | `Deprecated
        | `Hidden
        | `Inline
        | `Open
        | `Order_category
        | `Param of string
        | `Raise of string
        | `Return
        | `See of [ `Document | `File | `Url ] * string
        | `Short_title
        | `Since of string
        | `Toc_status
        | `Version of string ] ]
type media = [ `Audio | `Image | `Video ]
type media_href = [ `Link of string | `Reference of string ]
type media_markup =
    [ `Media_with_replacement_text of media_href * media * string
    | `Simple_media of media_href * media ]
val s_of_media :
  [< `Replaced | `Simple ] -> [< `Audio | `Image | `Video ] -> string
type code_block_tag =
    [ `Binding of
        string Odoc_parser_loc.with_location *
        string Odoc_parser_loc.with_location
    | `Tag of string Odoc_parser_loc.with_location ]
type code_block_tags = code_block_tag list
type t =
    [ `Bar
    | `Begin_link_with_replacement_text of string
    | `Begin_list of [ `Ordered | `Unordered ]
    | `Begin_list_item of [ `Dash | `Li ]
    | `Begin_paragraph_style of paragraph_style
    | `Begin_reference_with_replacement_text of string
    | `Begin_section_heading of int * string option
    | `Begin_style of style
    | `Begin_table_cell of [ `Data | `Header ]
    | `Begin_table_heavy
    | `Begin_table_light
    | `Begin_table_row
    | `Blank_line of string
    | `Code_block of
        (string Odoc_parser_loc.with_location * code_block_tags) option *
        string * string Odoc_parser_loc.with_location * bool
    | `Code_span of string
    | `End
    | `Math_block of string
    | `Math_span of string
    | `Media_with_replacement_text of media_href * media * string
    | `Minus
    | `Modules of string
    | `Plus
    | `Raw_markup of string option * string
    | `Right_brace
    | `Right_code_delimiter
    | `Simple_link of string
    | `Simple_media of media_href * media
    | `Simple_reference of string
    | `Single_newline of string
    | `Space of string
    | `Tag of
        [ `Author of string
        | `Before of string
        | `Canonical of string
        | `Children_order
        | `Closed
        | `Deprecated
        | `Hidden
        | `Inline
        | `Open
        | `Order_category
        | `Param of string
        | `Raise of string
        | `Return
        | `See of [ `Document | `File | `Url ] * string
        | `Short_title
        | `Since of string
        | `Toc_status
        | `Version of string ]
    | `Verbatim of string
    | `Word of string ]
val print :
  [< `Bar
   | `Begin_link_with_replacement_text of string & 'a
   | `Begin_list_item of [ `Dash | `Li ] & [< `Dash | `Li ]
   | `Begin_paragraph_style of
       paragraph_style &
       [< `Center | `Left | `Right ]
   | `Begin_reference_with_replacement_text of string & 'b
   | `Begin_section_heading of int * string option
   | `Begin_style of
       style &
       [< `Bold | `Emphasis | `Italic | `Subscript | `Superscript ]
   | `Begin_table_cell of [ `Data | `Header ] & [< `Data | `Header ]
   | `Begin_table_heavy
   | `Begin_table_light
   | `Begin_table_row
   | `Media_with_replacement_text of
       media_href * media * string &
       [< `Link of 'c | `Reference of 'd ] * [< `Audio | `Image | `Video ] *
       'e
   | `Minus
   | `Plus
   | `Raw_markup of string option * string & string option * 'f
   | `Simple_media of
       media_href * media &
       [< `Link of 'g | `Reference of 'h ] * [< `Audio | `Image | `Video ]
   | `Tag of
       [ `Author of string
       | `Before of string
       | `Canonical of string
       | `Children_order
       | `Closed
       | `Deprecated
       | `Hidden
       | `Inline
       | `Open
       | `Order_category
       | `Param of string
       | `Raise of string
       | `Return
       | `See of [ `Document | `File | `Url ] * string
       | `Short_title
       | `Since of string
       | `Toc_status
       | `Version of string ] &
       [< `Author of 'i
        | `Before of 'j
        | `Canonical of 'k
        | `Children_order
        | `Closed
        | `Deprecated
        | `Hidden
        | `Inline
        | `Open
        | `Order_category
        | `Param of 'l
        | `Raise of 'm
        | `Return
        | `See of 'n
        | `Short_title
        | `Since of 'o
        | `Toc_status
        | `Version of 'p ] ] ->
  string
val describe :
  [< `Bar
   | `Begin_link_with_replacement_text of string & 'a
   | `Begin_list of [ `Ordered | `Unordered ] & [< `Ordered | `Unordered ]
   | `Begin_list_item of [ `Dash | `Li ] & [< `Dash | `Li ]
   | `Begin_paragraph_style of
       paragraph_style &
       [< `Center | `Left | `Right ]
   | `Begin_reference_with_replacement_text of string & 'b
   | `Begin_section_heading of int * string option & int * 'c
   | `Begin_style of
       style &
       [< `Bold | `Emphasis | `Italic | `Subscript | `Superscript ]
   | `Begin_table_cell of [ `Data | `Header ] & [< `Data | `Header ]
   | `Begin_table_heavy
   | `Begin_table_light
   | `Begin_table_row
   | `Blank_line of string & 'd
   | `Code_block of
       (string Odoc_parser_loc.with_location * code_block_tags) option *
       string * string Odoc_parser_loc.with_location * bool &
       'e
   | `Code_span of string & 'f
   | `Comment
   | `End
   | `Math_block of string & 'g
   | `Math_span of string & 'h
   | `Media_with_replacement_text of
       media_href * media * string &
       [< `Link of 'i | `Reference of 'j ] * [< `Audio | `Image | `Video ] *
       'k
   | `Minus
   | `Modules of string & 'l
   | `Plus
   | `Raw_markup of string option * string & 'm
   | `Right_brace
   | `Right_code_delimiter
   | `Simple_link of string & 'n
   | `Simple_media of
       media_href * media &
       [< `Link of 'o | `Reference of 'p ] * [< `Audio | `Image | `Video ]
   | `Simple_reference of string & 'q
   | `Single_newline of string & 'r
   | `Space of string & 's
   | `Tag of
       [ `Author of string
       | `Before of string
       | `Canonical of string
       | `Children_order
       | `Closed
       | `Deprecated
       | `Hidden
       | `Inline
       | `Open
       | `Order_category
       | `Param of string
       | `Raise of string
       | `Return
       | `See of [ `Document | `File | `Url ] * string
       | `Short_title
       | `Since of string
       | `Toc_status
       | `Version of string ] &
       [< `Author of 't
        | `Before of 'u
        | `Canonical of 'v
        | `Children_order
        | `Closed
        | `Deprecated
        | `Hidden
        | `Inline
        | `Open
        | `Order_category
        | `Param of 'w
        | `Raise of 'x
        | `Return
        | `See of 'y
        | `Short_title
        | `Since of 'z
        | `Toc_status
        | `Version of 'a1 ]
   | `Verbatim of string & 'b1
   | `Word of string ] ->
  string
val describe_element :
  [< `Heading of int * 'a * 'b
   | `Link of 'c
   | `Reference of [< `Simple | `With_text ] * 'd * 'e ] ->
  string
