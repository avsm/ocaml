(** A lazy stream *)

type 'a t

val from : (int -> 'a option) -> 'a t
(** [from f] is a stream whose elements are produced on demand by [f]. [f] is
    called with the number of elements already produced and returns [Some x] to
    produce [x], or [None] to mark the end of the stream. *)

val peek : 'a t -> 'a option
(** [peek t] is the next element of [t], if any, without consuming it. *)

val junk : 'a t -> unit
(** [junk t] discards the next element of [t], if any. *)

val npeek : int -> 'a t -> 'a list
(** [npeek n t] is the list of the next [n] elements of [t] (or fewer if the
    stream is shorter), without consuming them. *)
