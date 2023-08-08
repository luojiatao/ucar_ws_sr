; Auto-generated. Do not edit!


(cl:in-package darknet_msgs-msg)


;//! \htmlinclude darknet.msg.html

(cl:defclass <darknet> (roslisp-msg-protocol:ros-message)
  ((E_cuv
    :reader E_cuv
    :initarg :E_cuv
    :type cl:fixnum
    :initform 0)
   (E_riv
    :reader E_riv
    :initarg :E_riv
    :type cl:fixnum
    :initform 0)
   (E_whv
    :reader E_whv
    :initarg :E_whv
    :type cl:fixnum
    :initform 0)
   (E_cov
    :reader E_cov
    :initarg :E_cov
    :type cl:fixnum
    :initform 0)
   (D_cuv
    :reader D_cuv
    :initarg :D_cuv
    :type cl:fixnum
    :initform 0)
   (D_riv
    :reader D_riv
    :initarg :D_riv
    :type cl:fixnum
    :initform 0)
   (D_whv
    :reader D_whv
    :initarg :D_whv
    :type cl:fixnum
    :initform 0)
   (D_cov
    :reader D_cov
    :initarg :D_cov
    :type cl:fixnum
    :initform 0)
   (C_cuv
    :reader C_cuv
    :initarg :C_cuv
    :type cl:fixnum
    :initform 0)
   (C_riv
    :reader C_riv
    :initarg :C_riv
    :type cl:fixnum
    :initform 0)
   (C_whv
    :reader C_whv
    :initarg :C_whv
    :type cl:fixnum
    :initform 0)
   (C_cov
    :reader C_cov
    :initarg :C_cov
    :type cl:fixnum
    :initform 0)
   (B_cuv
    :reader B_cuv
    :initarg :B_cuv
    :type cl:fixnum
    :initform 0)
   (B_riv
    :reader B_riv
    :initarg :B_riv
    :type cl:fixnum
    :initform 0)
   (B_whv
    :reader B_whv
    :initarg :B_whv
    :type cl:fixnum
    :initform 0)
   (B_cov
    :reader B_cov
    :initarg :B_cov
    :type cl:fixnum
    :initform 0)
   (F_cuf
    :reader F_cuf
    :initarg :F_cuf
    :type cl:fixnum
    :initform 0)
   (F_cof
    :reader F_cof
    :initarg :F_cof
    :type cl:fixnum
    :initform 0)
   (F_waf
    :reader F_waf
    :initarg :F_waf
    :type cl:fixnum
    :initform 0))
)

(cl:defclass darknet (<darknet>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <darknet>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'darknet)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name darknet_msgs-msg:<darknet> is deprecated: use darknet_msgs-msg:darknet instead.")))

(cl:ensure-generic-function 'E_cuv-val :lambda-list '(m))
(cl:defmethod E_cuv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:E_cuv-val is deprecated.  Use darknet_msgs-msg:E_cuv instead.")
  (E_cuv m))

(cl:ensure-generic-function 'E_riv-val :lambda-list '(m))
(cl:defmethod E_riv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:E_riv-val is deprecated.  Use darknet_msgs-msg:E_riv instead.")
  (E_riv m))

(cl:ensure-generic-function 'E_whv-val :lambda-list '(m))
(cl:defmethod E_whv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:E_whv-val is deprecated.  Use darknet_msgs-msg:E_whv instead.")
  (E_whv m))

(cl:ensure-generic-function 'E_cov-val :lambda-list '(m))
(cl:defmethod E_cov-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:E_cov-val is deprecated.  Use darknet_msgs-msg:E_cov instead.")
  (E_cov m))

(cl:ensure-generic-function 'D_cuv-val :lambda-list '(m))
(cl:defmethod D_cuv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:D_cuv-val is deprecated.  Use darknet_msgs-msg:D_cuv instead.")
  (D_cuv m))

(cl:ensure-generic-function 'D_riv-val :lambda-list '(m))
(cl:defmethod D_riv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:D_riv-val is deprecated.  Use darknet_msgs-msg:D_riv instead.")
  (D_riv m))

(cl:ensure-generic-function 'D_whv-val :lambda-list '(m))
(cl:defmethod D_whv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:D_whv-val is deprecated.  Use darknet_msgs-msg:D_whv instead.")
  (D_whv m))

(cl:ensure-generic-function 'D_cov-val :lambda-list '(m))
(cl:defmethod D_cov-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:D_cov-val is deprecated.  Use darknet_msgs-msg:D_cov instead.")
  (D_cov m))

(cl:ensure-generic-function 'C_cuv-val :lambda-list '(m))
(cl:defmethod C_cuv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:C_cuv-val is deprecated.  Use darknet_msgs-msg:C_cuv instead.")
  (C_cuv m))

(cl:ensure-generic-function 'C_riv-val :lambda-list '(m))
(cl:defmethod C_riv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:C_riv-val is deprecated.  Use darknet_msgs-msg:C_riv instead.")
  (C_riv m))

(cl:ensure-generic-function 'C_whv-val :lambda-list '(m))
(cl:defmethod C_whv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:C_whv-val is deprecated.  Use darknet_msgs-msg:C_whv instead.")
  (C_whv m))

(cl:ensure-generic-function 'C_cov-val :lambda-list '(m))
(cl:defmethod C_cov-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:C_cov-val is deprecated.  Use darknet_msgs-msg:C_cov instead.")
  (C_cov m))

(cl:ensure-generic-function 'B_cuv-val :lambda-list '(m))
(cl:defmethod B_cuv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:B_cuv-val is deprecated.  Use darknet_msgs-msg:B_cuv instead.")
  (B_cuv m))

(cl:ensure-generic-function 'B_riv-val :lambda-list '(m))
(cl:defmethod B_riv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:B_riv-val is deprecated.  Use darknet_msgs-msg:B_riv instead.")
  (B_riv m))

(cl:ensure-generic-function 'B_whv-val :lambda-list '(m))
(cl:defmethod B_whv-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:B_whv-val is deprecated.  Use darknet_msgs-msg:B_whv instead.")
  (B_whv m))

(cl:ensure-generic-function 'B_cov-val :lambda-list '(m))
(cl:defmethod B_cov-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:B_cov-val is deprecated.  Use darknet_msgs-msg:B_cov instead.")
  (B_cov m))

(cl:ensure-generic-function 'F_cuf-val :lambda-list '(m))
(cl:defmethod F_cuf-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:F_cuf-val is deprecated.  Use darknet_msgs-msg:F_cuf instead.")
  (F_cuf m))

(cl:ensure-generic-function 'F_cof-val :lambda-list '(m))
(cl:defmethod F_cof-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:F_cof-val is deprecated.  Use darknet_msgs-msg:F_cof instead.")
  (F_cof m))

(cl:ensure-generic-function 'F_waf-val :lambda-list '(m))
(cl:defmethod F_waf-val ((m <darknet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader darknet_msgs-msg:F_waf-val is deprecated.  Use darknet_msgs-msg:F_waf instead.")
  (F_waf m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <darknet>) ostream)
  "Serializes a message object of type '<darknet>"
  (cl:let* ((signed (cl:slot-value msg 'E_cuv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'E_riv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'E_whv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'E_cov)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'D_cuv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'D_riv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'D_whv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'D_cov)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'C_cuv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'C_riv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'C_whv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'C_cov)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B_cuv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B_riv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B_whv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B_cov)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'F_cuf)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'F_cof)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'F_waf)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <darknet>) istream)
  "Deserializes a message object of type '<darknet>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'E_cuv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'E_riv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'E_whv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'E_cov) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'D_cuv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'D_riv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'D_whv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'D_cov) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'C_cuv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'C_riv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'C_whv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'C_cov) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B_cuv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B_riv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B_whv) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B_cov) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'F_cuf) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'F_cof) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'F_waf) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<darknet>)))
  "Returns string type for a message object of type '<darknet>"
  "darknet_msgs/darknet")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'darknet)))
  "Returns string type for a message object of type 'darknet"
  "darknet_msgs/darknet")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<darknet>)))
  "Returns md5sum for a message object of type '<darknet>"
  "96d5d6b2bcac656db2c131f986f9c0bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'darknet)))
  "Returns md5sum for a message object of type 'darknet"
  "96d5d6b2bcac656db2c131f986f9c0bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<darknet>)))
  "Returns full string definition for message of type '<darknet>"
  (cl:format cl:nil "int8 E_cuv~%int8 E_riv~%int8 E_whv~%int8 E_cov~%~%int8 D_cuv~%int8 D_riv~%int8 D_whv~%int8 D_cov~%~%int8 C_cuv~%int8 C_riv~%int8 C_whv~%int8 C_cov~%~%int8 B_cuv~%int8 B_riv~%int8 B_whv~%int8 B_cov~%~%int8 F_cuf~%int8 F_cof~%int8 F_waf~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'darknet)))
  "Returns full string definition for message of type 'darknet"
  (cl:format cl:nil "int8 E_cuv~%int8 E_riv~%int8 E_whv~%int8 E_cov~%~%int8 D_cuv~%int8 D_riv~%int8 D_whv~%int8 D_cov~%~%int8 C_cuv~%int8 C_riv~%int8 C_whv~%int8 C_cov~%~%int8 B_cuv~%int8 B_riv~%int8 B_whv~%int8 B_cov~%~%int8 F_cuf~%int8 F_cof~%int8 F_waf~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <darknet>))
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
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <darknet>))
  "Converts a ROS message object to a list"
  (cl:list 'darknet
    (cl:cons ':E_cuv (E_cuv msg))
    (cl:cons ':E_riv (E_riv msg))
    (cl:cons ':E_whv (E_whv msg))
    (cl:cons ':E_cov (E_cov msg))
    (cl:cons ':D_cuv (D_cuv msg))
    (cl:cons ':D_riv (D_riv msg))
    (cl:cons ':D_whv (D_whv msg))
    (cl:cons ':D_cov (D_cov msg))
    (cl:cons ':C_cuv (C_cuv msg))
    (cl:cons ':C_riv (C_riv msg))
    (cl:cons ':C_whv (C_whv msg))
    (cl:cons ':C_cov (C_cov msg))
    (cl:cons ':B_cuv (B_cuv msg))
    (cl:cons ':B_riv (B_riv msg))
    (cl:cons ':B_whv (B_whv msg))
    (cl:cons ':B_cov (B_cov msg))
    (cl:cons ':F_cuf (F_cuf msg))
    (cl:cons ':F_cof (F_cof msg))
    (cl:cons ':F_waf (F_waf msg))
))
