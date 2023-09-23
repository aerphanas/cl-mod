(defsystem "cl-project-template"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-project-template/tests"))))

(defsystem "cl-project-template/tests"
  :author ""
  :license ""
  :depends-on ("cl-project-template"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-project-template"
  :perform (test-op (op c) (symbol-call :rove :run c)))
