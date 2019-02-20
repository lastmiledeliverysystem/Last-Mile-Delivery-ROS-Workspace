;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Imu)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Imu (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::IMU")
  (make-package "SENSORS_PKG::IMU"))

(in-package "ROS")
;;//! \htmlinclude Imu.msg.html


(defclass sensors_pkg::Imu
  :super ros::object
  :slots (_linearX _angularZ ))

(defmethod sensors_pkg::Imu
  (:init
   (&key
    ((:linearX __linearX) 0.0)
    ((:angularZ __angularZ) 0.0)
    )
   (send-super :init)
   (setq _linearX (float __linearX))
   (setq _angularZ (float __angularZ))
   self)
  (:linearX
   (&optional __linearX)
   (if __linearX (setq _linearX __linearX)) _linearX)
  (:angularZ
   (&optional __angularZ)
   (if __angularZ (setq _angularZ __angularZ)) _angularZ)
  (:serialization-length
   ()
   (+
    ;; float32 _linearX
    4
    ;; float32 _angularZ
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _linearX
       (sys::poke _linearX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angularZ
       (sys::poke _angularZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _linearX
     (setq _linearX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angularZ
     (setq _angularZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensors_pkg::Imu :md5sum-) "95d0b902c81b1f565dc6a9ceb49a25fb")
(setf (get sensors_pkg::Imu :datatype-) "sensors_pkg/Imu")
(setf (get sensors_pkg::Imu :definition-)
      "float32 linearX
float32 angularZ

")



(provide :sensors_pkg/Imu "95d0b902c81b1f565dc6a9ceb49a25fb")


