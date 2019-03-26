;; Auto-generated. Do not edit!


(when (boundp 'sensors_pkg::Camera)
  (if (not (find-package "SENSORS_PKG"))
    (make-package "SENSORS_PKG"))
  (shadow 'Camera (find-package "SENSORS_PKG")))
(unless (find-package "SENSORS_PKG::CAMERA")
  (make-package "SENSORS_PKG::CAMERA"))

(in-package "ROS")
;;//! \htmlinclude Camera.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sensors_pkg::Camera
  :super ros::object
  :slots (_header _image ))

(defmethod sensors_pkg::Camera
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:image __image) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _image __image)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:image
   (&optional __image)
   (if __image (setq _image __image)) _image)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8[] _image
    (* 1    (length _image)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8[] _image
     (write-long (length _image) s)
     (princ _image s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8[] _image
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _image (make-array n :element-type :char))
     (replace _image buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get sensors_pkg::Camera :md5sum-) "5e5fe811f24d7882e1a919590f00ae9e")
(setf (get sensors_pkg::Camera :datatype-) "sensors_pkg/Camera")
(setf (get sensors_pkg::Camera :definition-)
      "std_msgs/Header header

uint8[] image
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



(provide :sensors_pkg/Camera "5e5fe811f24d7882e1a919590f00ae9e")


