open Tensorflow_core
type float32_tensor = (float, Bigarray.float32_elt) Tensor.t

type t =
  { train_images : float32_tensor
  ; train_labels : float32_tensor
  ; test_images : float32_tensor
  ; test_labels : float32_tensor
  }

val read_files
  :  ?train_image_file:string
  -> ?train_label_file:string
  -> ?test_image_file:string
  -> ?test_label_file:string
  -> unit
  -> t

val train_batch
  :  t
  -> batch_size:int
  -> batch_idx:int
  -> float32_tensor * float32_tensor

val image_dim : int
val label_count : int

(** [accuracy label1 label2] returns the proportion of labels that are equal between
    [label1] and [label2].
*)
val accuracy
  :  float32_tensor
  -> float32_tensor
  -> float

(** [batch_accuracy ?samples t ~batch_size ~predict] computes the accuracy of
    the [predict] function on test images using batches of size at most
    [batch_size].  The average is computed on [samples] images.
*)
val batch_accuracy
  :  ?samples:int
  -> t
  -> [ `train | `test ]
  -> batch_size:int
  -> predict:(float32_tensor -> float32_tensor)
  -> float
