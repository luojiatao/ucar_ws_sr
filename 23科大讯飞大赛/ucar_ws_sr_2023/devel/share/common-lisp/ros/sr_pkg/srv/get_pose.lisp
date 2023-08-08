; Auto-generated. Do not edit!


(cl:in-package sr_pkg-srv)


;//! \htmlinclude get_pose-request.msg.html

(cl:defclass <get_pose-request> (roslisp-msg-protocol:ros-message)
  ((gobal_pose
    :reader gobal_pose
    :initarg :gobal_pose
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass get_pose-request (<get_pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_pkg-srv:<get_pose-request> is deprecated: use sr_pkg-srv:get_pose-request instead.")))

(cl:ensure-generic-function 'gobal_pose-val :lambda-list '(m))
(cl:defmethod gobal_pose-val ((m <get_pose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_pkg-srv:gobal_pose-val is deprecated.  Use sr_pkg-srv:gobal_pose instead.")
  (gobal_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_pose-request>) ostream)
  "Serializes a message object of type '<get_pose-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'gobal_pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_pose-request>) istream)
  "Deserializes a message object of type '<get_pose-request>"
  (cl:setf (cl:slot-value msg 'gobal_pose) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'gobal_pose)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_pose-request>)))
  "Returns string type for a service object of type '<get_pose-request>"
  "sr_pkg/get_poseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_pose-request)))
  "Returns string type for a service object of type 'get_pose-request"
  "sr_pkg/get_poseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_pose-request>)))
  "Returns md5sum for a message object of type '<get_pose-request>"
  "2e9083aa4360091925401acb66844bd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_pose-request)))
  "Returns md5sum for a message object of type 'get_pose-request"
  "2e9083aa4360091925401acb66844bd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_pose-request>)))
  "Returns full string definition for message of type '<get_pose-request>"
  (cl:format cl:nil "float32[3] gobal_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_pose-request)))
  "Returns full string definition for message of type 'get_pose-request"
  (cl:format cl:nil "float32[3] gobal_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_pose-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'gobal_pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'get_pose-request
    (cl:cons ':gobal_pose (gobal_pose msg))
))
;//! \htmlinclude get_pose-response.msg.html

(cl:defclass <get_pose-response> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type cl:fixnum
    :initform 0)
   (pose1
    :reader pose1
    :initarg :pose1
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (pose2
    :reader pose2
    :initarg :pose2
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass get_pose-response (<get_pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sr_pkg-srv:<get_pose-response> is deprecated: use sr_pkg-srv:get_pose-response instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <get_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_pkg-srv:count-val is deprecated.  Use sr_pkg-srv:count instead.")
  (count m))

(cl:ensure-generic-function 'pose1-val :lambda-list '(m))
(cl:defmethod pose1-val ((m <get_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_pkg-srv:pose1-val is deprecated.  Use sr_pkg-srv:pose1 instead.")
  (pose1 m))

(cl:ensure-generic-function 'pose2-val :lambda-list '(m))
(cl:defmethod pose2-val ((m <get_pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sr_pkg-srv:pose2-val is deprecated.  Use sr_pkg-srv:pose2 instead.")
  (pose2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_pose-response>) ostream)
  "Serializes a message object of type '<get_pose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pose1))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pose2))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_pose-response>) istream)
  "Deserializes a message object of type '<get_pose-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'count)) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose1) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'pose1)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'pose2) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'pose2)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_pose-response>)))
  "Returns string type for a service object of type '<get_pose-response>"
  "sr_pkg/get_poseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_pose-response)))
  "Returns string type for a service object of type 'get_pose-response"
  "sr_pkg/get_poseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_pose-response>)))
  "Returns md5sum for a message object of type '<get_pose-response>"
  "2e9083aa4360091925401acb66844bd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_pose-response)))
  "Returns md5sum for a message object of type 'get_pose-response"
  "2e9083aa4360091925401acb66844bd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_pose-response>)))
  "Returns full string definition for message of type '<get_pose-response>"
  (cl:format cl:nil "uint8 count ~%float32[3] pose1~%float32[3] pose2~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_pose-response)))
  "Returns full string definition for message of type 'get_pose-response"
  (cl:format cl:nil "uint8 count ~%float32[3] pose1~%float32[3] pose2~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_pose-response>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'pose1) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'pose2) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'get_pose-response
    (cl:cons ':count (count msg))
    (cl:cons ':pose1 (pose1 msg))
    (cl:cons ':pose2 (pose2 msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'get_pose)))
  'get_pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'get_pose)))
  'get_pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_pose)))
  "Returns string type for a service object of type '<get_pose>"
  "sr_pkg/get_pose")