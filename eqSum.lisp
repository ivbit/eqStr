#! /usr/bin/sbcl --script

#|
Intellectual property information START

Copyright (c) 2024 Ivan Bityutskiy

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Intellectual property information END

Description START

The script compares 2 strings, case-insensitive (for MD5 and SHA sum, etc.).

Usage:
./eqSum.lisp
  OR comment the 1st line, then:
clisp eqSum.lisp
sbcl --script eqSum.lisp
ccl64 -l eqSum.lisp -e '(quit)'

Description END
|#

(defparameter cRed (coerce '(#\Esc #\[ #\3 #\8 #\; #\5 #\; #\1 #\2 #\4 #\m) 'string))
(defparameter cGreen (coerce '(#\Esc #\[ #\3 #\8 #\; #\5 #\; #\2 #\8 #\m) 'string))
(defparameter cNormal (coerce '(#\Esc #\[ #\0 #\m) 'string))
; Ask user to input the string
(format t "~%Str 1: ")
(finish-output)
(defparameter str1 (string-trim '(#\Space #\Tab #\Newline) (read-line)))
(princ "Str 2: ")
(finish-output)
(defparameter str2 (string-trim '(#\Space #\Tab #\Newline) (read-line)))

(cond
  ( ; condition START
    (string-equal str1 str2)
    (format t "~%~a~a~a~a~%~%" cGreen "Equal" cNormal " (case-insensitive).")
    #+clisp
      (quit 0)
    #+sbcl
      (quit :unix-status 0)
    #+clozure
      (quit 0)
    ) ; condition END
  ( ; default condition START
    t
    (format t "~%~a~a~a~a~%~%" cRed "Not equal" cNormal " (case-insensitive).")
    #+clisp
      (quit 1)
    #+sbcl
      (quit :unix-status 1)
    #+clozure
      (quit 1)
    ) ; default condition END
  ) ; cond END

;; END OF SCRIPT

