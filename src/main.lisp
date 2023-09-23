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
  (format t "symbolic"))

(declaim (ftype (function (string)) permission-symbolic-numeric))
(defun permission-symbolic-numeric (symbolic-str)
  "convert symbolic input to numeric (octal)"
  (format t "numeric"))

(defun valid-inputp (str &key numeric symbolic)
  "validate input for furter calculation"
  (let ((input-length (length str)))
    (cond (numeric
	   (if (and (= input-length 3)
		    (cl-ppcre:scan "^[01243567]{3}$" str))
	       t
	       nil))
	  (symbolic
	   (if (and (= input-length 9)
		    (cl-ppcre:scan "^[rwx-]{9}$" str))
	       t
	       nil))
	  (t nil))))

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
