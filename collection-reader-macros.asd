;;;; collection-reader-macros.asd

(asdf:defsystem #:collection-reader-macros
  :description "Clojure style reader macros for vector and hash-table"
  :author "Daniel Keogh <keogh.daniel@gmail.com>"
  :license "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:alexandria)
  :components ((:file "package")
               (:file "collection-reader-macros")))
