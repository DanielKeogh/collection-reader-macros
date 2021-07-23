;;;; collection-reader-macros.lisp

(in-package #:collection-reader-macros)

;; Vector reader macro

(defconstant +left-bracket+ #\[)
(defconstant +right-bracket+ #\])

(defun vector-reader (stream char)
  (declare (ignore char)
	   (optimize (speed 3) (safety 0)))
  (let ((lst (read-delimited-list +right-bracket+ stream nil)))
    `(vector ,@lst)))

(defun no-matching-bracket (stream char)
  (declare (ignore stream char))
  (error "No matching [ for ]"))

(set-macro-character +left-bracket+ 'vector-reader)
(set-macro-character +right-bracket+ 'no-matching-bracket)

;; Hash-table reader macro

(defconstant +left-brace+ #\{)
(defconstant +right-brace+ #\})

(defun hash-table-reader (stream char)
  (declare (ignore char)
	   (optimize (speed 3) (safety 0)))
  (let ((lst (read-delimited-list +right-brace+ stream nil)))
    (when (oddp (length lst)) (error "Odd number of pairs in hash-table"))
    (alexandria:with-gensyms (table)
      `(let ((,table (make-hash-table :test 'equal)))
	 (setf ,@(loop for (key value) on lst by #'cddr
		       collect `(gethash ,key ,table)
		       collect value))
	 ,table))))

(defun no-matching-brace (stream char)
  (declare (ignore stream char))
  (error "No matching { for }"))

(set-macro-character +left-brace+ 'hash-table-reader)
(set-macro-character +right-brace+ 'no-matching-brace)

;; Pretty print hash table

(defvar *hash-table-print-limit* 100)

(defmethod print-object ((table hash-table) stream)
  (declare (optimize (speed 3) (safety 0))
	   (type stream stream)
	   (type fixnum *hash-table-print-limit*))
  (let ((len (hash-table-count table)))
    (if (> len *hash-table-print-limit*)
	(format stream "#<HASH-TABLE :TEST ~A :COUNT ~A>" (hash-table-test table) len)
	(format stream "#{~{~a ~a~^,~^ ~}}" (alexandria:hash-table-plist table)))))
