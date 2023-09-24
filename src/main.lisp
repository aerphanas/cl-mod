(defpackage cl-mod
  (:use
   :cl)
  (:export
   :main))

(in-package :cl-mod)

(declaim (ftype (function ()) help))
(defun help ()
  "output help message on console"
  (progn
    (format t "NAME:~% cl-mod - File permision callculator~%~%")
    (format t "USAGE:~% cl-mod [arguments ...]~%~%")
    (progn
      (format t "EXAMPLES:~% ~% get permision number from string : ~%~%")
      (format t " cl-mod rw-r--r--~%")
      (format t "~% get permision string from number : ~%~%")
      (format t " cl-mod 644~%~%"))
    (format t "AUTHORS:~% Muhammad Aviv Burhanudin <muhamadaviv14@gmail.com>~%~%")
    (format t "LICENSE:~% ISC~%~%")))

(declaim (ftype (function (string)) permission-numeric-symbolic))
(defun permission-numeric-symbolic (numeric-str)
  "convert numeric (octal) input to symbolic "
  (flet ((get-symbolic-rpr (num)
	   (case (char numeric-str num)
	     (#\4 (format nil "r--"))
	     (#\5 (format nil "r-x"))
	     (#\6 (format nil "rw-"))
	     (#\7 (format nil "rwx"))
	     (otherwise (format nil "---")))))
    (let ((first-numeric  (get-symbolic-rpr 0))
	  (second-numeric (get-symbolic-rpr 1))
	  (third-numeric  (get-symbolic-rpr 2)))
      (format t "Result : ~{~A~}~%"
	      (list first-numeric
		    second-numeric
		    third-numeric)))))
    
(declaim (ftype (function (string)) permission-symbolic-numeric))
(defun permission-symbolic-numeric (symbolic-str)
  "convert symbolic input to numeric (octal)"
  (labels ((split-string-to (str num)
	     (loop for i from 0 below (length str) by num
		   collect (subseq str i (+ i num))))
	   (symb-equalp (num str)
	     (string-equal (nth num (split-string-to symbolic-str 3)) str))
	   (get-numeric-rpr (num)
	     (cond ((symb-equalp num "r--") #\4)
		   ((symb-equalp num "rw-") #\6)
		   ((symb-equalp num "rwx") #\7)
		   ((symb-equalp num "r-x") #\5)
		   (t #\0))))
    (let ((first-symbolic  (get-numeric-rpr 0))
	  (second-symbolic (get-numeric-rpr 1))
	  (third-symbolic  (get-numeric-rpr 2)))
      (format t "Result : ~{~A~}~%"
	      (list first-symbolic
		    second-symbolic
		    third-symbolic)))))

(defun valid-inputp (str &key numeric symbolic)
  "validate input for furter calculation"
  (let ((input-length (length str)))
    (cond (numeric
	   (if (and (= input-length 3)
		    (cl-ppcre:scan "^[0124567]{3}$" str))
	       t
	       nil))
	  (symbolic
	   (if (and (= input-length 9)
		    (cl-ppcre:scan "^[rwx-]{9}$" str))
	       t
	       nil))
	  (t
	   nil))))

(declaim (ftype (function ()) main))
(defun main ()
  (let ((input-length
	  (length (car (uiop:command-line-arguments))))
	(input-args
	  (car (uiop:command-line-arguments))))
    (cond ((valid-inputp input-args :symbolic t)
	   (permission-symbolic-numeric input-args))
	  ((valid-inputp input-args :numeric t)
	   (permission-numeric-symbolic input-args))
	  (t (help)))))

;; blah blah blah.
