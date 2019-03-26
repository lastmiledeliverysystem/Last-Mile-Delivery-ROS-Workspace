; Auto-generated. Do not edit!


(cl:in-package sensors_pkg-msg)


;//! \htmlinclude Camera.msg.html

(cl:defclass <Camera> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (image
    :reader image
    :initarg :image
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Camera (<Camera>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Camera>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Camera)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensors_pkg-msg:<Camera> is deprecated: use sensors_pkg-msg:Camera instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Camera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:header-val is deprecated.  Use sensors_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Camera>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:image-val is deprecated.  Use sensors_pkg-msg:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Camera>) ostream)
  "Serializes a message object of type '<Camera>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'image))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'image))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Camera>) istream)
  "Deserializes a message object of type '<Camera>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'image) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'image)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Camera>)))
  "Returns string type for a message object of type '<Camera>"
  "sensors_pkg/Camera")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Camera)))
  "Returns string type for a message object of type 'Camera"
  "sensors_pkg/Camera")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Camera>)))
  "Returns md5sum for a message object of type '<Camera>"
  "5e5fe811f24d7882e1a919590f00ae9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Camera)))
  "Returns md5sum for a message object of type 'Camera"
  "5e5fe811f24d7882e1a919590f00ae9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Camera>)))
  "Returns full string definition for message of type '<Camera>"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8[] image~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Camera)))
  "Returns full string definition for message of type 'Camera"
  (cl:format cl:nil "std_msgs/Header header~%~%uint8[] image~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Camera>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'image) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Camera>))
  "Converts a ROS message object to a list"
  (cl:list 'Camera
    (cl:cons ':header (header msg))
    (cl:cons ':image (image msg))
))
