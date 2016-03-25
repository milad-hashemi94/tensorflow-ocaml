val const_float
  :  ?name:string
  -> ?shape:int list
  -> type_:([< `float | `double ] as 'dtype) Node.Type.t
  -> float list
  -> 'dtype Node.t

val const_int
  :  ?name:string
  -> ?shape:int list
  -> type_:([< `int32 | `int64 ] as 'dtype) Node.Type.t
  -> int list
  -> 'dtype Node.t

val scalar
  :  type_:([< `float | `double ] as 'dtype) Node.Type.t
  -> float
  -> 'dtype Node.t

type 't b =  ?name:string -> 't Node.t -> 't Node.t -> 't Node.t

val (+) : [< `float | `double | `int32 | `int64 | `complex64 | `string ] b
val (-) : [< `float | `double | `int32 | `int64 | `complex64 ] b
val (/) : [< `float | `double | `int32 | `int64 | `complex64 ] b
val ( * ) : [< `float | `double | `int32 | `int64 | `complex64 ] b
val ( *^) : [< `float | `double | `int32 | `complex64 ] b
val ( *.) : [< `float | `double | `int32 | `complex64 ] b

(* Scalar *)
val f : float -> [ `float ] Node.t
val d : float -> [ `double ] Node.t

(* Constant vector/matrixes *)
val cf : ?shape:int list -> float list -> [ `float ] Node.t
val cd : ?shape:int list -> float list -> [ `double ] Node.t

(* Variables *)
val varf : int list -> [ `float ] Node.t
val vard : int list -> [ `double ] Node.t