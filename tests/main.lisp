(defpackage cl-mod/tests/main
	    (:use
	     :cl
             :cl-mod
             :rove))

(in-package :cl-mod/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-mod)' in your Lisp.

(deftest permission-converter-test
  (testing "rw-r--r-- should be 644"
	   (ok (string-equal
		(cl-mod::permission-symbolic-numeric "rw-r--r--")
		(format nil "644"))))
  (testing "644 should be rw-r--r--"
	   (ok (string-equal
		(cl-mod::permission-numeric-symbolic "644")
		(format nil "rw-r--r--"))))
  (testing "rwxrwxrwx should be 777"
	   (ok (string-equal
		(cl-mod::permission-symbolic-numeric "rwxrwxrwx")
		(format nil "777"))))
  (testing "777 should be rwxrwxrwx"
	   (ok (string-equal
		(cl-mod::permission-numeric-symbolic "777")
		(format nil "rwxrwxrwx")))))

(deftest input-validation-test
  (testing "input 644 should be valid"
    (ok (cl-mod::valid-inputp "644" :numeric t)))
  (testing "input rw-r--r-- should be valid"
    (ok (cl-mod::valid-inputp "rw-r--r--" :symbolic t)))
  (testing "input rw-r-r-- should be invalid"
    (ok (not (cl-mod::valid-inputp "rw-r-r--" :symbolic t))))
  (testing "input 999 should be invalid"
    (ok (not (cl-mod::valid-inputp "999" :numeric t)))))
