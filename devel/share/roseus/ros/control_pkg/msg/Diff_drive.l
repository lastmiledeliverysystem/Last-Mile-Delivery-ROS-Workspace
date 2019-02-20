;; Auto-generated. Do not edit!


(when (boundp 'control_pkg::Diff_drive)
  (if (not (find-package "CONTROL_PKG"))
    (make-package "CONTROL_PKG"))
  (shadow 'Diff_drive (find-package "CONTROL_PKG")))
(unless (find-package "CONTROL_PKG::DIFF_DRIVE")
  (make-package "CONTROL_PKG::DIFF_DRIVE"))

(in-package "ROS")
;;//! \htmlinclude Diff_drive.msg.html


(defclass control_pkg::Diff_drive
  :super ros::object
  :slots (_v _w ))

(defmethod control_pkg::Diff_drive
  (:init
   (&key
    ((:v __v) 0.0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _v (float __v))
   (setq _w (float __w))
   self)
  (:v
   (&optional __v)
   (if __v (setq _v __v)) _v)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; float32 _v
    4
    ;; float32 _w
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _v
       (sys::poke _v (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _v
     (setq _v (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get control_pkg::Diff_drive :md5sum-) "9b52b8b58fa2fef1c7db8f924121a1fa")
(setf (get control_pkg::Diff_drive :datatype-) "control_pkg/Diff_drive")
(setf (get control_pkg::Diff_drive :definition-)
      "float32 v
float32 w
")



(provide :control_pkg/Diff_drive "9b52b8b58fa2fef1c7db8f924121a1fa")


