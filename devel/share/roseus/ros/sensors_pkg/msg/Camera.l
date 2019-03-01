;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Camera)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Camera (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::CAMERA")
  (make-package "SENSORS_PKG::CAMERA"))

(in-package "ROS")
;;//! \htmlinclude Camera.msg.html


(defclass sensors_pkg::Camera
  :super ros::object
  :slots (_image ))

(defmethod sensors_pkg::Camera
  (:init
   (&key
    ((:image __image) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&optional __image)
   (if __image (setq _image __image)) _image)
  (:serialization-length
   ()
   (+
    ;; uint8[] _image
    (* 1    (length _image)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _image
     (write-long (length _image) s)
     (princ _image s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _image
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _image (make-array n :element-type :char))
     (replace _image buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get sensors_pkg::Camera :md5sum-) "85b29a6da51a67c94507ec65a8dccd72")
(setf (get sensors_pkg::Camera :datatype-) "sensors_pkg/Camera")
(setf (get sensors_pkg::Camera :definition-)
      "uint8[] image
")



(provide :sensors_pkg/Camera "85b29a6da51a67c94507ec65a8dccd72")


