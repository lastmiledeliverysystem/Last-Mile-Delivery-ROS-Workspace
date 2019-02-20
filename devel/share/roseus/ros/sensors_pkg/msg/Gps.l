;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Gps)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Gps (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::GPS")
  (make-package "SENSORS_PKG::GPS"))

(in-package "ROS")
;;//! \htmlinclude Gps.msg.html


(defclass sensors_pkg::Gps
  :super ros::object
  :slots (_long _lat ))

(defmethod sensors_pkg::Gps
  (:init
   (&key
    ((:long __long) 0.0)
    ((:lat __lat) 0.0)
    )
   (send-super :init)
   (setq _long (float __long))
   (setq _lat (float __lat))
   self)
  (:long
   (&optional __long)
   (if __long (setq _long __long)) _long)
  (:lat
   (&optional __lat)
   (if __lat (setq _lat __lat)) _lat)
  (:serialization-length
   ()
   (+
    ;; float32 _long
    4
    ;; float32 _lat
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _long
       (sys::poke _long (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lat
       (sys::poke _lat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _long
     (setq _long (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lat
     (setq _lat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensors_pkg::Gps :md5sum-) "7abaaee080310abc2b3b4a45bd04059e")
(setf (get sensors_pkg::Gps :datatype-) "sensors_pkg/Gps")
(setf (get sensors_pkg::Gps :definition-)
      "float32 long
float32 lat
")



(provide :sensors_pkg/Gps "7abaaee080310abc2b3b4a45bd04059e")


