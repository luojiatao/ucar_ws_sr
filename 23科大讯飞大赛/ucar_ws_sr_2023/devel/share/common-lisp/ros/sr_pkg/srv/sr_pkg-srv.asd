
(cl:in-package :asdf)

(defsystem "sr_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "get_pose" :depends-on ("_package_get_pose"))
    (:file "_package_get_pose" :depends-on ("_package"))
  ))