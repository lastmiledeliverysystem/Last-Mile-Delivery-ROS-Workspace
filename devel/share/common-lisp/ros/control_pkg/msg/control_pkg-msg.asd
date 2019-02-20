
(cl:in-package :asdf)

(defsystem "control_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Diff_drive" :depends-on ("_package_Diff_drive"))
    (:file "_package_Diff_drive" :depends-on ("_package"))
  ))