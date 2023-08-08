;; Auto-generated. Do not edit!


(when (boundp 'darknet_msgs::darknet)
  (if (not (find-package "DARKNET_MSGS"))
    (make-package "DARKNET_MSGS"))
  (shadow 'darknet (find-package "DARKNET_MSGS")))
(unless (find-package "DARKNET_MSGS::DARKNET")
  (make-package "DARKNET_MSGS::DARKNET"))

(in-package "ROS")
;;//! \htmlinclude darknet.msg.html


(defclass darknet_msgs::darknet
  :super ros::object
  :slots (_E_cuv _E_riv _E_whv _E_cov _D_cuv _D_riv _D_whv _D_cov _C_cuv _C_riv _C_whv _C_cov _B_cuv _B_riv _B_whv _B_cov _F_cuf _F_cof _F_waf ))

(defmethod darknet_msgs::darknet
  (:init
   (&key
    ((:E_cuv __E_cuv) 0)
    ((:E_riv __E_riv) 0)
    ((:E_whv __E_whv) 0)
    ((:E_cov __E_cov) 0)
    ((:D_cuv __D_cuv) 0)
    ((:D_riv __D_riv) 0)
    ((:D_whv __D_whv) 0)
    ((:D_cov __D_cov) 0)
    ((:C_cuv __C_cuv) 0)
    ((:C_riv __C_riv) 0)
    ((:C_whv __C_whv) 0)
    ((:C_cov __C_cov) 0)
    ((:B_cuv __B_cuv) 0)
    ((:B_riv __B_riv) 0)
    ((:B_whv __B_whv) 0)
    ((:B_cov __B_cov) 0)
    ((:F_cuf __F_cuf) 0)
    ((:F_cof __F_cof) 0)
    ((:F_waf __F_waf) 0)
    )
   (send-super :init)
   (setq _E_cuv (round __E_cuv))
   (setq _E_riv (round __E_riv))
   (setq _E_whv (round __E_whv))
   (setq _E_cov (round __E_cov))
   (setq _D_cuv (round __D_cuv))
   (setq _D_riv (round __D_riv))
   (setq _D_whv (round __D_whv))
   (setq _D_cov (round __D_cov))
   (setq _C_cuv (round __C_cuv))
   (setq _C_riv (round __C_riv))
   (setq _C_whv (round __C_whv))
   (setq _C_cov (round __C_cov))
   (setq _B_cuv (round __B_cuv))
   (setq _B_riv (round __B_riv))
   (setq _B_whv (round __B_whv))
   (setq _B_cov (round __B_cov))
   (setq _F_cuf (round __F_cuf))
   (setq _F_cof (round __F_cof))
   (setq _F_waf (round __F_waf))
   self)
  (:E_cuv
   (&optional __E_cuv)
   (if __E_cuv (setq _E_cuv __E_cuv)) _E_cuv)
  (:E_riv
   (&optional __E_riv)
   (if __E_riv (setq _E_riv __E_riv)) _E_riv)
  (:E_whv
   (&optional __E_whv)
   (if __E_whv (setq _E_whv __E_whv)) _E_whv)
  (:E_cov
   (&optional __E_cov)
   (if __E_cov (setq _E_cov __E_cov)) _E_cov)
  (:D_cuv
   (&optional __D_cuv)
   (if __D_cuv (setq _D_cuv __D_cuv)) _D_cuv)
  (:D_riv
   (&optional __D_riv)
   (if __D_riv (setq _D_riv __D_riv)) _D_riv)
  (:D_whv
   (&optional __D_whv)
   (if __D_whv (setq _D_whv __D_whv)) _D_whv)
  (:D_cov
   (&optional __D_cov)
   (if __D_cov (setq _D_cov __D_cov)) _D_cov)
  (:C_cuv
   (&optional __C_cuv)
   (if __C_cuv (setq _C_cuv __C_cuv)) _C_cuv)
  (:C_riv
   (&optional __C_riv)
   (if __C_riv (setq _C_riv __C_riv)) _C_riv)
  (:C_whv
   (&optional __C_whv)
   (if __C_whv (setq _C_whv __C_whv)) _C_whv)
  (:C_cov
   (&optional __C_cov)
   (if __C_cov (setq _C_cov __C_cov)) _C_cov)
  (:B_cuv
   (&optional __B_cuv)
   (if __B_cuv (setq _B_cuv __B_cuv)) _B_cuv)
  (:B_riv
   (&optional __B_riv)
   (if __B_riv (setq _B_riv __B_riv)) _B_riv)
  (:B_whv
   (&optional __B_whv)
   (if __B_whv (setq _B_whv __B_whv)) _B_whv)
  (:B_cov
   (&optional __B_cov)
   (if __B_cov (setq _B_cov __B_cov)) _B_cov)
  (:F_cuf
   (&optional __F_cuf)
   (if __F_cuf (setq _F_cuf __F_cuf)) _F_cuf)
  (:F_cof
   (&optional __F_cof)
   (if __F_cof (setq _F_cof __F_cof)) _F_cof)
  (:F_waf
   (&optional __F_waf)
   (if __F_waf (setq _F_waf __F_waf)) _F_waf)
  (:serialization-length
   ()
   (+
    ;; int8 _E_cuv
    1
    ;; int8 _E_riv
    1
    ;; int8 _E_whv
    1
    ;; int8 _E_cov
    1
    ;; int8 _D_cuv
    1
    ;; int8 _D_riv
    1
    ;; int8 _D_whv
    1
    ;; int8 _D_cov
    1
    ;; int8 _C_cuv
    1
    ;; int8 _C_riv
    1
    ;; int8 _C_whv
    1
    ;; int8 _C_cov
    1
    ;; int8 _B_cuv
    1
    ;; int8 _B_riv
    1
    ;; int8 _B_whv
    1
    ;; int8 _B_cov
    1
    ;; int8 _F_cuf
    1
    ;; int8 _F_cof
    1
    ;; int8 _F_waf
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _E_cuv
       (write-byte _E_cuv s)
     ;; int8 _E_riv
       (write-byte _E_riv s)
     ;; int8 _E_whv
       (write-byte _E_whv s)
     ;; int8 _E_cov
       (write-byte _E_cov s)
     ;; int8 _D_cuv
       (write-byte _D_cuv s)
     ;; int8 _D_riv
       (write-byte _D_riv s)
     ;; int8 _D_whv
       (write-byte _D_whv s)
     ;; int8 _D_cov
       (write-byte _D_cov s)
     ;; int8 _C_cuv
       (write-byte _C_cuv s)
     ;; int8 _C_riv
       (write-byte _C_riv s)
     ;; int8 _C_whv
       (write-byte _C_whv s)
     ;; int8 _C_cov
       (write-byte _C_cov s)
     ;; int8 _B_cuv
       (write-byte _B_cuv s)
     ;; int8 _B_riv
       (write-byte _B_riv s)
     ;; int8 _B_whv
       (write-byte _B_whv s)
     ;; int8 _B_cov
       (write-byte _B_cov s)
     ;; int8 _F_cuf
       (write-byte _F_cuf s)
     ;; int8 _F_cof
       (write-byte _F_cof s)
     ;; int8 _F_waf
       (write-byte _F_waf s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _E_cuv
     (setq _E_cuv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _E_cuv 127) (setq _E_cuv (- _E_cuv 256)))
   ;; int8 _E_riv
     (setq _E_riv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _E_riv 127) (setq _E_riv (- _E_riv 256)))
   ;; int8 _E_whv
     (setq _E_whv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _E_whv 127) (setq _E_whv (- _E_whv 256)))
   ;; int8 _E_cov
     (setq _E_cov (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _E_cov 127) (setq _E_cov (- _E_cov 256)))
   ;; int8 _D_cuv
     (setq _D_cuv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _D_cuv 127) (setq _D_cuv (- _D_cuv 256)))
   ;; int8 _D_riv
     (setq _D_riv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _D_riv 127) (setq _D_riv (- _D_riv 256)))
   ;; int8 _D_whv
     (setq _D_whv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _D_whv 127) (setq _D_whv (- _D_whv 256)))
   ;; int8 _D_cov
     (setq _D_cov (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _D_cov 127) (setq _D_cov (- _D_cov 256)))
   ;; int8 _C_cuv
     (setq _C_cuv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _C_cuv 127) (setq _C_cuv (- _C_cuv 256)))
   ;; int8 _C_riv
     (setq _C_riv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _C_riv 127) (setq _C_riv (- _C_riv 256)))
   ;; int8 _C_whv
     (setq _C_whv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _C_whv 127) (setq _C_whv (- _C_whv 256)))
   ;; int8 _C_cov
     (setq _C_cov (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _C_cov 127) (setq _C_cov (- _C_cov 256)))
   ;; int8 _B_cuv
     (setq _B_cuv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _B_cuv 127) (setq _B_cuv (- _B_cuv 256)))
   ;; int8 _B_riv
     (setq _B_riv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _B_riv 127) (setq _B_riv (- _B_riv 256)))
   ;; int8 _B_whv
     (setq _B_whv (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _B_whv 127) (setq _B_whv (- _B_whv 256)))
   ;; int8 _B_cov
     (setq _B_cov (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _B_cov 127) (setq _B_cov (- _B_cov 256)))
   ;; int8 _F_cuf
     (setq _F_cuf (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _F_cuf 127) (setq _F_cuf (- _F_cuf 256)))
   ;; int8 _F_cof
     (setq _F_cof (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _F_cof 127) (setq _F_cof (- _F_cof 256)))
   ;; int8 _F_waf
     (setq _F_waf (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _F_waf 127) (setq _F_waf (- _F_waf 256)))
   ;;
   self)
  )

(setf (get darknet_msgs::darknet :md5sum-) "96d5d6b2bcac656db2c131f986f9c0bb")
(setf (get darknet_msgs::darknet :datatype-) "darknet_msgs/darknet")
(setf (get darknet_msgs::darknet :definition-)
      "int8 E_cuv
int8 E_riv
int8 E_whv
int8 E_cov

int8 D_cuv
int8 D_riv
int8 D_whv
int8 D_cov

int8 C_cuv
int8 C_riv
int8 C_whv
int8 C_cov

int8 B_cuv
int8 B_riv
int8 B_whv
int8 B_cov

int8 F_cuf
int8 F_cof
int8 F_waf
")



(provide :darknet_msgs/darknet "96d5d6b2bcac656db2c131f986f9c0bb")


