(defsystem "cl-mod"
  :version "0.1.0"
  :author "Muhammad Aviv Burhanudin"
  :license "ISC"
  :depends-on ("cl-ppcre")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "File permision callculator"
  :in-order-to ((test-op (test-op "cl-mod/tests")))
  :build-operation "program-op"
  :build-pathname "cl-mod"
  :entry-point "cl-mod:main")

(defsystem "cl-mod/tests"
  :author "Muhammad Aviv Burhanudin"
  :license "ISC"
  :depends-on ("cl-mod"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-mod"
  :perform (test-op (op c) (symbol-call :rove :run c)))
