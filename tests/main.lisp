(defpackage cl-mod/tests/main
	    (:use
	     :cl
             :cl-mod
             :rove))
(in-package :cl-mod/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-mod)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
