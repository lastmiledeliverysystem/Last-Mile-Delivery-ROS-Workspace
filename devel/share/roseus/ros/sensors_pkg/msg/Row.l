;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Row)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Row (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::ROW")
  (make-package "SENSORS_PKG::ROW"))

(in-package "ROS")
;;//! \htmlinclude Row.msg.html


(defclass sensors_pkg::Row
  :super ros::object
  :slots (_data ))

(defmethod sensors_pkg::Row
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get sensors_pkg::Row :md5sum-) "f43a8e1b362b75baa741461b46adc7e0")
(setf (get sensors_pkg::Row :datatype-) "sensors_pkg/Row")
(setf (get sensors_pkg::Row :definition-)
      "uint8[] data
")



(provide :sensors_pkg/Row "f43a8e1b362b75baa741461b46adc7e0")


