; Auto-generated. Do not edit!


(cl:in-package sensors_pkg-msg)


;//! \htmlinclude Row.msg.html

(cl:defclass <Row> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Row (<Row>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Row>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Row)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensors_pkg-msg:<Row> is deprecated: use sensors_pkg-msg:Row instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Row>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensors_pkg-msg:data-val is deprecated.  Use sensors_pkg-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Row>) ostream)
  "Serializes a message object of type '<Row>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Row>) istream)
  "Deserializes a message object of type '<Row>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Row>)))
  "Returns string type for a message object of type '<Row>"
  "sensors_pkg/Row")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Row)))
  "Returns string type for a message object of type 'Row"
  "sensors_pkg/Row")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Row>)))
  "Returns md5sum for a message object of type '<Row>"
  "f43a8e1b362b75baa741461b46adc7e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Row)))
  "Returns md5sum for a message object of type 'Row"
  "f43a8e1b362b75baa741461b46adc7e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Row>)))
  "Returns full string definition for message of type '<Row>"
  (cl:format cl:nil "uint8[] data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Row)))
  "Returns full string definition for message of type 'Row"
  (cl:format cl:nil "uint8[] data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Row>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Row>))
  "Converts a ROS message object to a list"
  (cl:list 'Row
    (cl:cons ':data (data msg))
))
