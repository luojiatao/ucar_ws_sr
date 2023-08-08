; Auto-generated. Do not edit!


(cl:in-package darknet_msgs-msg)


;//! \htmlinclude darknet2.msg.html

(cl:defclass <darknet2> (roslisp-msg-protocol:ros-message)
  ((cuf1
    :reader cuf1
    :initarg :cuf1
    :type cl:fixnum
    :initform 0)
   (cuf2
    :reader cuf2
    :initarg :cuf2
    :type cl:fixnum
    :initform 0)
   (cuf3
    :reader cuf3
    :initarg :cuf3
    :type cl:fixnum
    :initform 0)
   (cof1
    :reader cof1
    :initarg :cof1
    :type cl:fixnum
    :initform 0)
   (cof2
    :reader cof2
    :initarg :cof2
    :type cl:fixnum
    :initform 0)
   (waf
    :reader waf
    :initarg :waf
    :type cl:fixnum
    :initform 0)
   (cuv
    :reader cuv
    :initarg :cuv
    :type cl:fixnum
    :initform 0)
   (riv
    :reader riv
    :initarg :riv
    :type cl:fixnum
    :initform 0)
   (whv
    :reader whv
    :initarg :whv
    :type cl:fixnum
    :initform 0)
   (cov
    :reader cov
    :initarg :cov
    :type cl:fixnum
    :initform 0))
)

(cl:defclass darknet2 (<darknet2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <darknet2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'darknet2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name darknet_msgs-msg:<darknet2> is deprecated: use darknet_msgs-msg:darknet2 instead.")))

(cl:ensure-generic-function 'cuf1-val :lambda-list '(m))
(cl:defmethod cuf1-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cuf1-val is deprecated.  Use darknet_msgs-msg:cuf1 instead.")
  (cuf1 m))

(cl:ensure-generic-function 'cuf2-val :lambda-list '(m))
(cl:defmethod cuf2-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cuf2-val is deprecated.  Use darknet_msgs-msg:cuf2 instead.")
  (cuf2 m))

(cl:ensure-generic-function 'cuf3-val :lambda-list '(m))
(cl:defmethod cuf3-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cuf3-val is deprecated.  Use darknet_msgs-msg:cuf3 instead.")
  (cuf3 m))

(cl:ensure-generic-function 'cof1-val :lambda-list '(m))
(cl:defmethod cof1-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cof1-val is deprecated.  Use darknet_msgs-msg:cof1 instead.")
  (cof1 m))

(cl:ensure-generic-function 'cof2-val :lambda-list '(m))
(cl:defmethod cof2-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cof2-val is deprecated.  Use darknet_msgs-msg:cof2 instead.")
  (cof2 m))

(cl:ensure-generic-function 'waf-val :lambda-list '(m))
(cl:defmethod waf-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:waf-val is deprecated.  Use darknet_msgs-msg:waf instead.")
  (waf m))

(cl:ensure-generic-function 'cuv-val :lambda-list '(m))
(cl:defmethod cuv-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cuv-val is deprecated.  Use darknet_msgs-msg:cuv instead.")
  (cuv m))

(cl:ensure-generic-function 'riv-val :lambda-list '(m))
(cl:defmethod riv-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:riv-val is deprecated.  Use darknet_msgs-msg:riv instead.")
  (riv m))

(cl:ensure-generic-function 'whv-val :lambda-list '(m))
(cl:defmethod whv-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:whv-val is deprecated.  Use darknet_msgs-msg:whv instead.")
  (whv m))

(cl:ensure-generic-function 'cov-val :lambda-list '(m))
(cl:defmethod cov-val ((m <darknet2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:cov-val is deprecated.  Use darknet_msgs-msg:cov instead.")
  (cov m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <darknet2>) ostream)
  "Serializes a message object of type '<darknet2>"
  (cl:let* ((signed (cl:slot-value msg 'cuf1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cuf2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cuf3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cof1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cof2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'waf)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cuv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'riv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'whv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'cov)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <darknet2>) istream)
  "Deserializes a message object of type '<darknet2>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cuf1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cuf2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cuf3) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cof1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cof2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'waf) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cuv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'riv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'whv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cov) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<darknet2>)))
  "Returns string type for a message object of type '<darknet2>"
  "darknet_msgs/darknet2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'darknet2)))
  "Returns string type for a message object of type 'darknet2"
  "darknet_msgs/darknet2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<darknet2>)))
  "Returns md5sum for a message object of type '<darknet2>"
  "926901501b0964cda8759316557a1042")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'darknet2)))
  "Returns md5sum for a message object of type 'darknet2"
  "926901501b0964cda8759316557a1042")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<darknet2>)))
  "Returns full string definition for message of type '<darknet2>"
  (cl:format cl:nil "int8 cuf1~%int8 cuf2~%int8 cuf3~%int8 cof1~%int8 cof2~%int8 waf~%int8 cuv~%int8 riv~%int8 whv~%int8 cov~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'darknet2)))
  "Returns full string definition for message of type 'darknet2"
  (cl:format cl:nil "int8 cuf1~%int8 cuf2~%int8 cuf3~%int8 cof1~%int8 cof2~%int8 waf~%int8 cuv~%int8 riv~%int8 whv~%int8 cov~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <darknet2>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <darknet2>))
  "Converts a ROS message object to a list"
  (cl:list 'darknet2
    (cl:cons ':cuf1 (cuf1 msg))
    (cl:cons ':cuf2 (cuf2 msg))
    (cl:cons ':cuf3 (cuf3 msg))
    (cl:cons ':cof1 (cof1 msg))
    (cl:cons ':cof2 (cof2 msg))
    (cl:cons ':waf (waf msg))
    (cl:cons ':cuv (cuv msg))
    (cl:cons ':riv (riv msg))
    (cl:cons ':whv (whv msg))
    (cl:cons ':cov (cov msg))
))
