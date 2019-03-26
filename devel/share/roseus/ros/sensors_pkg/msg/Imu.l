;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Imu)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Imu (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::IMU")
  (make-package "SENSORS_PKG::IMU"))

(in-package "ROS")
;;//! \htmlinclude Imu.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sensors_pkg::Imu
  :super ros::object
  :slots (_header _linearX _angularZ ))

(defmethod sensors_pkg::Imu
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:linearX __linearX) 0.0)
    ((:angularZ __angularZ) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _linearX (float __linearX))
   (setq _angularZ (float __angularZ))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:linearX
   (&optional __linearX)
   (if __linearX (setq _linearX __linearX)) _linearX)
  (:angularZ
   (&optional __angularZ)
   (if __angularZ (setq _angularZ __angularZ)) _angularZ)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _linearX
    4
    ;; float32 _angularZ
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _linearX
       (sys::poke _linearX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angularZ
       (sys::poke _angularZ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _linearX
     (setq _linearX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angularZ
     (setq _angularZ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensors_pkg::Imu :md5sum-) "28ac01ad4f2b4bb4075e47575365d707")
(setf (get sensors_pkg::Imu :datatype-) "sensors_pkg/Imu")
(setf (get sensors_pkg::Imu :definition-)
      "std_msgs/Header header
float32 linearX
float32 angularZ

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :sensors_pkg/Imu "28ac01ad4f2b4bb4075e47575365d707")


