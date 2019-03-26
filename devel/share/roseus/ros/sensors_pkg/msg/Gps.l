;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Gps)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Gps (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::GPS")
  (make-package "SENSORS_PKG::GPS"))

(in-package "ROS")
;;//! \htmlinclude Gps.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sensors_pkg::Gps
  :super ros::object
  :slots (_header _long _lat ))

(defmethod sensors_pkg::Gps
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:long __long) 0.0)
    ((:lat __lat) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _long (float __long))
   (setq _lat (float __lat))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:long
   (&optional __long)
   (if __long (setq _long __long)) _long)
  (:lat
   (&optional __lat)
   (if __lat (setq _lat __lat)) _lat)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _long
    4
    ;; float32 _lat
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _long
       (sys::poke _long (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lat
       (sys::poke _lat (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _long
     (setq _long (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lat
     (setq _lat (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensors_pkg::Gps :md5sum-) "79b1a997315c99c0a2fa9ebb0fb67098")
(setf (get sensors_pkg::Gps :datatype-) "sensors_pkg/Gps")
(setf (get sensors_pkg::Gps :definition-)
      "std_msgs/Header header
float32 long
float32 lat
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



(provide :sensors_pkg/Gps "79b1a997315c99c0a2fa9ebb0fb67098")


