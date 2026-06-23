(** Parser for ocamldoc formatted comments. *)

type t
(** [type t] is the result of parsing. *)

val parse_comment : location:Lexing.position -> text:string -> t
(** [parse_comment ~location ~text] parses [text] as an ocamldoc formatted
    string. The parser will try to recover from any invalid syntax encountered,
    and therefore this will always produce a result without raising exceptions
    with zero or more warnings. The location passed in should represent the
    start of the {i content} of the documentation comment - so for a line such
    as
    {[
      (** A comment starting in the first column (0) *)
    ]}
    the location should represent the space immediately before the [A], so the
    in the 4th column (e.g. [{... pos_bol=0; pos_cnum=3 }]) *)

module Ast = Odoc_parser_ast
module Loc = Odoc_parser_loc

(** Warnings produced during parsing. *)
module Warning : sig
  type t = Odoc_parser_warning.t = { location : Odoc_parser_loc.span; message : string }
  (** Warnings are represented as record containing the human-readable text of
      the warning alongside the location of the offending text in the source *)

  val pp : Format.formatter -> t -> unit
  (** Pretty printer for {!t} *)

  val to_string : t -> string
  (** [to_string] will format the location and warning as text to be printed. *)
end

val warnings : t -> Odoc_parser_warning.t list
(** Extract any warnings from the parser result. *)

val ast : t -> Odoc_parser_ast.t
(** Extract the {!Odoc_parser_ast.t} from the parser result. *)

val position_of_point : t -> Odoc_parser_loc.point -> Lexing.position
(** Helper function to turn the internal representation of positions back into
    the usual representation in the Lexing module. Note that this relies on the
    information passed in {!parse_comment}, and hence requires the result of
    that call in addition to the {!Odoc_parser_loc.point} being converted. *)

val codeblock_content : Odoc_parser_loc.span -> string -> string * Odoc_parser_warning.t list
(** Process the content of a code block, following the rules described
    {{!/odoc/odoc_for_authors.indentation_code_blocks}here}. To achieve this, it
    needs the location of the code block (including the separators) and the raw
    content of the code block. For instance, with the following code block:

    {delim@ocaml[
      {[
        hello
      ]}
    ]delim}

    We can go from the raw content ["\n    hello\n  "] to the processed content
    ["  hello"] with:
    {[
      match codeblock.value with
      | `Code_block { content; _ } ->
          codeblock_content codeblock.location content.value
    ]}

    Also returns a list of warnings, eg if the content is not appropriately
    indented. *)

val verbatim_content : Odoc_parser_loc.span -> string -> string * Odoc_parser_warning.t list
(** Similar to {!codeblock_content} but for verbatims. *)
