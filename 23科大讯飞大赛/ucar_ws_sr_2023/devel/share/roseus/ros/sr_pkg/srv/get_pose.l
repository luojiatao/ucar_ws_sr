;; Auto-generated. Do not edit!


(when (boundp 'sr_pkg::get_pose)
  (if (not (find-package "SR_PKG"))
    (make-package "SR_PKG"))
  (shadow 'get_pose (find-package "SR_PKG")))
(unless (find-package "SR_PKG::GET_POSE")
  (make-package "SR_PKG::GET_POSE"))
(unless (find-package "SR_PKG::GET_POSEREQUEST")
  (make-package "SR_PKG::GET_POSEREQUEST"))
(unless (find-package "SR_PKG::GET_POSERESPONSE")
  (make-package "SR_PKG::GET_POSERESPONSE"))

(in-package "ROS")





(defclass sr_pkg::get_poseRequest
  :super ros::object
  :slots (_gobal_pose ))

(defmethod sr_pkg::get_poseRequest
  (:init
   (&key
    ((:gobal_pose __gobal_pose) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _gobal_pose __gobal_pose)
   self)
  (:gobal_pose
   (&optional __gobal_pose)
   (if __gobal_pose (setq _gobal_pose __gobal_pose)) _gobal_pose)
  (:serialization-length
   ()
   (+
    ;; float32[3] _gobal_pose
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _gobal_pose
     (dotimes (i 3)
       (sys::poke (elt _gobal_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _gobal_pose
   (dotimes (i (length _gobal_pose))
     (setf (elt _gobal_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(defclass sr_pkg::get_poseResponse
  :super ros::object
  :slots (_count _pose1 _pose2 ))

(defmethod sr_pkg::get_poseResponse
  (:init
   (&key
    ((:count __count) 0)
    ((:pose1 __pose1) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:pose2 __pose2) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _count (round __count))
   (setq _pose1 __pose1)
   (setq _pose2 __pose2)
   self)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:pose1
   (&optional __pose1)
   (if __pose1 (setq _pose1 __pose1)) _pose1)
  (:pose2
   (&optional __pose2)
   (if __pose2 (setq _pose2 __pose2)) _pose2)
  (:serialization-length
   ()
   (+
    ;; uint8 _count
    1
    ;; float32[3] _pose1
    (* 4    3)
    ;; float32[3] _pose2
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _count
       (write-byte _count s)
     ;; float32[3] _pose1
     (dotimes (i 3)
       (sys::poke (elt _pose1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _pose2
     (dotimes (i 3)
       (sys::poke (elt _pose2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _count
     (setq _count (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[3] _pose1
   (dotimes (i (length _pose1))
     (setf (elt _pose1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _pose2
   (dotimes (i (length _pose2))
     (setf (elt _pose2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(defclass sr_pkg::get_pose
  :super ros::object
  :slots ())

(setf (get sr_pkg::get_pose :md5sum-) "2e9083aa4360091925401acb66844bd2")
(setf (get sr_pkg::get_pose :datatype-) "sr_pkg/get_pose")
(setf (get sr_pkg::get_pose :request) sr_pkg::get_poseRequest)
(setf (get sr_pkg::get_pose :response) sr_pkg::get_poseResponse)

(defmethod sr_pkg::get_poseRequest
  (:response () (instance sr_pkg::get_poseResponse :init)))

(setf (get sr_pkg::get_poseRequest :md5sum-) "2e9083aa4360091925401acb66844bd2")
(setf (get sr_pkg::get_poseRequest :datatype-) "sr_pkg/get_poseRequest")
(setf (get sr_pkg::get_poseRequest :definition-)
      "float32[3] gobal_pose
---
uint8 count 
float32[3] pose1
float32[3] pose2

")

(setf (get sr_pkg::get_poseResponse :md5sum-) "2e9083aa4360091925401acb66844bd2")
(setf (get sr_pkg::get_poseResponse :datatype-) "sr_pkg/get_poseResponse")
(setf (get sr_pkg::get_poseResponse :definition-)
      "float32[3] gobal_pose
---
uint8 count 
float32[3] pose1
float32[3] pose2

")



(provide :sr_pkg/get_pose "2e9083aa4360091925401acb66844bd2")


