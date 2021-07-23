# collection-reader-macros
## Reader Macros

Included are clojure style reader macros for vectors and hash-tables.

Vectors can be defined with square bracket syntax:
e.g.
`[1 2 3]` is equivalent to `(vector 1 2 3)`

And `{:key1 "value1" :key2 "value2"}` is equivalent to:
`(let ((hash (make-hash-table :test 'equal)))
      (setf (gethash :key1 hash) "value1"
      	    (gethash :key2 hash) "value2")
     hash)`

## Pretty Printing

Also included is an override of print-object for hash-table. The maximum number of pairs printed is defined bybefore items printed before *hash-table-print-limit*`

## Please Consider before including this

This is an opinionated library that will change the syntax of Common Lisp as soon as it is loaded.
It is not recommended that this library is set as a dependency of other projects as unwanted effects may occur.

## License

Copyright 2021 Daniel Keogh

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.