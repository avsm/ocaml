(* Interface generated with [ocamlc -i] for the in-tree build (compilerlibs requires every module to carry a .mli). *)

type 'a with_location = 'a Odoc_parser_loc.with_location
type style = [ `Bold | `Emphasis | `Italic | `Subscript | `Superscript ]
type alignment = [ `Center | `Left | `Right ]
type reference_kind = [ `Simple | `With_text ]
type inline_element =
    [ `Code_span of string
    | `Link of string * inline_element with_location list
    | `Math_span of string
    | `Raw_markup of string option * string
    | `Reference of
        reference_kind * string with_location *
        inline_element with_location list
    | `Space of string
    | `Styled of style * inline_element with_location list
    | `Word of string ]
type 'a cell = 'a with_location list * [ `Data | `Header ]
type 'a row = 'a cell list
type 'a grid = 'a row list
type 'a abstract_table = 'a grid * alignment option list option
type code_block_tag =
    [ `Binding of string with_location * string with_location
    | `Tag of string with_location ]
type code_block_tags = code_block_tag list
type code_block_meta = {
  language : string with_location;
  tags : code_block_tags;
}
type media = Odoc_parser_token.media
type media_href = Odoc_parser_token.media_href
type code_block = {
  meta : code_block_meta option;
  delimiter : string option;
  content : string with_location;
  output : nestable_block_element with_location list option;
}
and nestable_block_element =
    [ `Code_block of code_block
    | `List of
        [ `Ordered | `Unordered ] * [ `Heavy | `Light ] *
        nestable_block_element with_location list list
    | `Math_block of string
    | `Media of reference_kind * media_href with_location * string * media
    | `Modules of string with_location list
    | `Paragraph of inline_element with_location list
    | `Table of table
    | `Verbatim of string ]
and table = nestable_block_element abstract_table * [ `Heavy | `Light ]
type internal_tag =
    [ `Canonical of string with_location
    | `Children_order of nestable_block_element with_location list
    | `Closed
    | `Hidden
    | `Inline
    | `Open
    | `Order_category of nestable_block_element with_location list
    | `Short_title of nestable_block_element with_location list
    | `Toc_status of nestable_block_element with_location list ]
type ocamldoc_tag =
    [ `Author of string
    | `Before of string * nestable_block_element with_location list
    | `Deprecated of nestable_block_element with_location list
    | `Param of string * nestable_block_element with_location list
    | `Raise of string * nestable_block_element with_location list
    | `Return of nestable_block_element with_location list
    | `See of
        [ `Document | `File | `Url ] * string *
        nestable_block_element with_location list
    | `Since of string
    | `Version of string ]
type tag =
    [ `Author of string
    | `Before of string * nestable_block_element with_location list
    | `Canonical of string with_location
    | `Children_order of nestable_block_element with_location list
    | `Closed
    | `Deprecated of nestable_block_element with_location list
    | `Hidden
    | `Inline
    | `Open
    | `Order_category of nestable_block_element with_location list
    | `Param of string * nestable_block_element with_location list
    | `Raise of string * nestable_block_element with_location list
    | `Return of nestable_block_element with_location list
    | `See of
        [ `Document | `File | `Url ] * string *
        nestable_block_element with_location list
    | `Short_title of nestable_block_element with_location list
    | `Since of string
    | `Toc_status of nestable_block_element with_location list
    | `Version of string ]
type heading = int * string option * inline_element with_location list
type block_element =
    [ `Code_block of code_block
    | `Heading of heading
    | `List of
        [ `Ordered | `Unordered ] * [ `Heavy | `Light ] *
        nestable_block_element with_location list list
    | `Math_block of string
    | `Media of reference_kind * media_href with_location * string * media
    | `Modules of string with_location list
    | `Paragraph of inline_element with_location list
    | `Table of table
    | `Tag of tag
    | `Verbatim of string ]
type t = block_element with_location list
