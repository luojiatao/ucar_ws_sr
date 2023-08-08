
(cl:in-package :asdf)

(defsystem "darknet_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "darknet" :depends-on ("_package_darknet"))
    (:file "_package_darknet" :depends-on ("_package"))
    (:file "darknet2" :depends-on ("_package_darknet2"))
    (:file "_package_darknet2" :depends-on ("_package"))
  ))