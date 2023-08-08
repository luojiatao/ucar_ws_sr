;; Auto-generated. Do not edit!


(when (boundp 'darknet_msgs::darknet2)
  (if (not (find-package "DARKNET_MSGS"))
    (make-package "DARKNET_MSGS"))
  (shadow 'darknet2 (find-package "DARKNET_MSGS")))
(unless (find-package "DARKNET_MSGS::DARKNET2")
  (make-package "DARKNET_MSGS::DARKNET2"))

(in-package "ROS")
;;//! \htmlinclude darknet2.msg.html


(defclass darknet_msgs::darknet2
  :super ros::object
  :slots (_cuf1 _cuf2 _cuf3 _cof1 _cof2 _waf _cuv _riv _whv _cov ))

(defmethod darknet_msgs::darknet2
  (:init
   (&key
    ((:cuf1 __cuf1) 0)
    ((:cuf2 __cuf2) 0)
    ((:cuf3 __cuf3) 0)
    ((:cof1 __cof1) 0)
    ((:cof2 __cof2) 0)
    ((:waf __waf) 0)
    ((:cuv __cuv) 0)
    ((:riv __riv) 0)
    ((:whv __whv) 0)
    ((:cov __cov) 0)
    )
   (send-super :init)
   (setq _cuf1 (round __cuf1))
   (setq _cuf2 (round __cuf2))
   (setq _cuf3 (round __cuf3))
   (setq _cof1 (round __cof1))
   (setq _cof2 (round __cof2))
   (setq _waf (round __waf))
   (setq _cuv (round __cuv))
   (setq _riv (round __riv))
   (setq _whv (round __whv))
   (setq _cov (round __cov))
   self)
  (:cuf1
   (&optional __cuf1)
   (if __cuf1 (setq _cuf1 __cuf1)) _cuf1)
  (:cuf2
   (&optional __cuf2)
   (if __cuf2 (setq _cuf2 __cuf2)) _cuf2)
  (:cuf3
   (&optional __cuf3)
   (if __cuf3 (setq _cuf3 __cuf3)) _cuf3)
  (:cof1
   (&optional __cof1)
   (if __cof1 (setq _cof1 __cof1)) _cof1)
  (:cof2
   (&optional __cof2)
   (if __cof2 (setq _cof2 __cof2)) _cof2)
  (:waf
   (&optional __waf)
   (if __waf (setq _waf __waf)) _waf)
  (:cuv
   (&optional __cuv)
   (if __cuv (setq _cuv __cuv)) _cuv)
  (:riv
   (&optional __riv)
   (if __riv (setq _riv __riv)) _riv)
  (:whv
   (&optional __whv)
   (if __whv (setq _whv __whv)) _whv)
  (:cov
   (&optional __cov)
   (if __cov (setq _cov __cov)) _cov)
  (:serialization-length
   ()
   (+
    ;; int8 _cuf1
    1
    ;; int8 _cuf2
    1
    ;; int8 _cuf3
    1
    ;; int8 _cof1
    1
    ;; int8 _cof2
    1
    ;; int8 _waf
    1
    ;; int8 _cuv
    1
    ;; int8 _riv
    1
    ;; int8 _whv
    1
    ;; int8 _cov
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _cuf1
       (write-byte _cuf1 s)
     ;; int8 _cuf2
       (write-byte _cuf2 s)
     ;; int8 _cuf3
       (write-byte _cuf3 s)
     ;; int8 _cof1
       (write-byte _cof1 s)
     ;; int8 _cof2
       (write-byte _cof2 s)
     ;; int8 _waf
       (write-byte _waf s)
     ;; int8 _cuv
       (write-byte _cuv s)
     ;; int8 _riv
       (write-byte _riv s)
     ;; int8 _whv
       (write-byte _whv s)
     ;; int8 _cov
       (write-byte _cov s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _cuf1
     (setq _cuf1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cuf1 127) (setq _cuf1 (- _cuf1 256)))
   ;; int8 _cuf2
     (setq _cuf2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cuf2 127) (setq _cuf2 (- _cuf2 256)))
   ;; int8 _cuf3
     (setq _cuf3 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cuf3 127) (setq _cuf3 (- _cuf3 256)))
   ;; int8 _cof1
     (setq _cof1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cof1 127) (setq _cof1 (- _cof1 256)))
   ;; int8 _cof2
     (setq _cof2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cof2 127) (setq _cof2 (- _cof2 256)))
   ;; int8 _waf
     (setq _waf (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _waf 127) (setq _waf (- _waf 256)))
   ;; int8 _cuv
     (setq _cuv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cuv 127) (setq _cuv (- _cuv 256)))
   ;; int8 _riv
     (setq _riv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _riv 127) (setq _riv (- _riv 256)))
   ;; int8 _whv
     (setq _whv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _whv 127) (setq _whv (- _whv 256)))
   ;; int8 _cov
     (setq _cov (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cov 127) (setq _cov (- _cov 256)))
   ;;
   self)
  )

(setf (get darknet_msgs::darknet2 :md5sum-) "926901501b0964cda8759316557a1042")
(setf (get darknet_msgs::darknet2 :datatype-) "darknet_msgs/darknet2")
(setf (get darknet_msgs::darknet2 :definition-)
      "int8 cuf1
int8 cuf2
int8 cuf3
int8 cof1
int8 cof2
int8 waf
int8 cuv
int8 riv
int8 whv
int8 cov


")



(provide :darknet_msgs/darknet2 "926901501b0964cda8759316557a1042")


