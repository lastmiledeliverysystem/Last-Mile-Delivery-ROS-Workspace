; Auto-generated. Do not edit!


(cl:in-package sensors_pkg-msg)


;//! \htmlinclude Gps.msg.html

(cl:defclass <Gps> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (long
    :reader long
    :initarg :long
    :type cl:float
    :initform 0.0)
   (lat
    :reader lat
    :initarg :lat
    :type cl:float
    :initform 0.0))
)

(cl:defclass Gps (<Gps>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gps>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gps)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensors_pkg-msg:<Gps> is deprecated: use sensors_pkg-msg:Gps instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:header-val is deprecated.  Use sensors_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'long-val :lambda-list '(m))
(cl:defmethod long-val ((m <Gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:long-val is deprecated.  Use sensors_pkg-msg:long instead.")
  (long m))

(cl:ensure-generic-function 'lat-val :lambda-list '(m))
(cl:defmethod lat-val ((m <Gps>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:lat-val is deprecated.  Use sensors_pkg-msg:lat instead.")
  (lat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gps>) ostream)
  "Serializes a message object of type '<Gps>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'long))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gps>) istream)
  "Deserializes a message object of type '<Gps>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'long) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lat) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gps>)))
  "Returns string type for a message object of type '<Gps>"
  "sensors_pkg/Gps")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gps)))
  "Returns string type for a message object of type 'Gps"
  "sensors_pkg/Gps")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gps>)))
  "Returns md5sum for a message object of type '<Gps>"
  "79b1a997315c99c0a2fa9ebb0fb67098")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gps)))
  "Returns md5sum for a message object of type 'Gps"
  "79b1a997315c99c0a2fa9ebb0fb67098")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gps>)))
  "Returns full string definition for message of type '<Gps>"
  (cl:format cl:nil "std_msgs/Header header~%float32 long~%float32 lat~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gps)))
  "Returns full string definition for message of type 'Gps"
  (cl:format cl:nil "std_msgs/Header header~%float32 long~%float32 lat~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gps>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gps>))
  "Converts a ROS message object to a list"
  (cl:list 'Gps
    (cl:cons ':header (header msg))
    (cl:cons ':long (long msg))
    (cl:cons ':lat (lat msg))
))
