(defpackage cl-project-template/tests/main
  (:use :cl
        :cl-project-template
        :rove))
(in-package :cl-project-template/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-project-template)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
