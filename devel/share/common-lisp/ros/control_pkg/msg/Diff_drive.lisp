; Auto-generated. Do not edit!


(cl:in-package control_pkg-msg)


;//! \htmlinclude Diff_drive.msg.html

(cl:defclass <Diff_drive> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (v
    :reader v
    :initarg :v
    :type cl:float
    :initform 0.0)
   (w
    :reader w
    :initarg :w
    :type cl:float
    :initform 0.0))
)

(cl:defclass Diff_drive (<Diff_drive>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Diff_drive>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Diff_drive)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_pkg-msg:<Diff_drive> is deprecated: use control_pkg-msg:Diff_drive instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Diff_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_pkg-msg:header-val is deprecated.  Use control_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'v-val :lambda-list '(m))
(cl:defmethod v-val ((m <Diff_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_pkg-msg:v-val is deprecated.  Use control_pkg-msg:v instead.")
  (v m))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <Diff_drive>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_pkg-msg:w-val is deprecated.  Use control_pkg-msg:w instead.")
  (w m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Diff_drive>) ostream)
  "Serializes a message object of type '<Diff_drive>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Diff_drive>) istream)
  "Deserializes a message object of type '<Diff_drive>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'w) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Diff_drive>)))
  "Returns string type for a message object of type '<Diff_drive>"
  "control_pkg/Diff_drive")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Diff_drive)))
  "Returns string type for a message object of type 'Diff_drive"
  "control_pkg/Diff_drive")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Diff_drive>)))
  "Returns md5sum for a message object of type '<Diff_drive>"
  "c9739f01512ce85d8ac1ccdd6bde650b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Diff_drive)))
  "Returns md5sum for a message object of type 'Diff_drive"
  "c9739f01512ce85d8ac1ccdd6bde650b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Diff_drive>)))
  "Returns full string definition for message of type '<Diff_drive>"
  (cl:format cl:nil "std_msgs/Header header~%float32 v~%float32 w~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Diff_drive)))
  "Returns full string definition for message of type 'Diff_drive"
  (cl:format cl:nil "std_msgs/Header header~%float32 v~%float32 w~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Diff_drive>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Diff_drive>))
  "Converts a ROS message object to a list"
  (cl:list 'Diff_drive
    (cl:cons ':header (header msg))
    (cl:cons ':v (v msg))
    (cl:cons ':w (w msg))
))
