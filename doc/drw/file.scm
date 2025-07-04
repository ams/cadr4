#!chezscheme
(import (scheme base)
        (scheme char)
        (only (srfi :1) delete take drop iota find append-map filter)
        (only (srfi :13) string-suffix? string-prefix?)
        (only (re-games) read-binary-file
              oct hex bin pp u8)
        (only (mit-compat) burst-string string-replace-string-all delete-duplicates group-by)
        (only (chezscheme) bitwise-arithmetic-shift-left bitwise-arithmetic-shift-right bitwise-and bitwise-ior bitwise-bit-set? bitwise-not last-pair format with-output-to-file sort directory-list display-condition)
        (sxml-to-xml))

(define << bitwise-arithmetic-shift-left)
(define >> bitwise-arithmetic-shift-right)
(define & bitwise-and)

(define *debug-unpack* #f)
(define *debug-structure* #f)
(define *debug-raw* #f)
(define (debug-raw vector)
  (let loop ((i 0))
    (if (> i (vector-length vector))
        'done
        (let ((w (vector-ref vector i)))
          (debug-raw-word i (>> w 18) (& w #x3ff))
          (loop (+ i 1))))))
(define (debug-raw-word index l r)
  (let* ((num (+ (<< l 18) r))
         (ns (map char->integer (word->7bit-ascii num)))
         (cs (map (lambda (n)
                    (if (and (>= n (char->integer #\space))
                             (<= n (char->integer #\~)))
                        (integer->char n)
                        #\.))
                  ns))
         (str (apply string cs)))
    (format #t "~4,'0d ~6,'0o ~6,'0o ~a ~7d ~7d~%" (* 2 index) l r str (int18 l) (int18 r))))
(define (unpack bytevector)
  "Unpack the bytevector into 36 bit words according to unpack.c"
  (let ((up (make-vector (* 1024 1024 16) 0))
        (up_index 0)
        (incnt 0))
    (define first (vector #o000 #o001 #o002 #o003 #o004 #o005 #o006 #o007
                          #o010 #o011 #o015 #o013 #o014 #o012 #o016 #o017
                          #o020 #o021 #o022 #o023 #o024 #o025 #o026 #o027
                          #o030 #o031 #o032 #o033 #o034 #o035 #o036 #o037
                          #o040 #o041 #o042 #o043 #o044 #o045 #o046 #o047
                          #o050 #o051 #o052 #o053 #o054 #o055 #o056 #o057
                          #o060 #o061 #o062 #o063 #o064 #o065 #o066 #o067
                          #o070 #o071 #o072 #o073 #o074 #o075 #o076 #o077
                          #o100 #o101 #o102 #o103 #o104 #o105 #o106 #o107
                          #o110 #o111 #o112 #o113 #o114 #o115 #o116 #o117
                          #o120 #o121 #o122 #o123 #o124 #o125 #o126 #o127
                          #o130 #o131 #o132 #o133 #o134 #o135 #o136 #o137
                          #o140 #o141 #o142 #o143 #o144 #o145 #o146 #o147
                          #o150 #o151 #o152 #o153 #o154 #o155 #o156 #o157
                          #o160 #o161 #o162 #o163 #o164 #o165 #o166 #o167
                          #o170 #o171 #o172 #o173 #o174 #o175 #o176 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o177 #o177
                          #o177 #o177 #o177 #o177 #o177 #o177 #o015 #o177))
    (define NONE #o200)
    (define second (vector NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE #o012 NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE NONE
                           NONE NONE NONE NONE NONE NONE NONE #o007
                           #o000 #o001 #o002 #o003 #o004 #o005 #o006 #o177
                           #o010 #o011 #o015 #o013 #o014 #o012 #o016 #o017
                           #o020 #o021 #o022 #o023 #o024 #o025 #o026 #o027
                           #o030 #o031 #o032 #o033 #o034 #o035 #o036 #o037
                           #o040 #o041 #o042 #o043 #o044 #o045 #o046 #o047
                           #o050 #o051 #o052 #o053 #o054 #o055 #o056 #o057
                           #o060 #o061 #o062 #o063 #o064 #o065 #o066 #o067
                           #o070 #o071 #o072 #o073 #o074 #o075 #o076 #o077
                           #o100 #o101 #o102 #o103 #o104 #o105 #o106 #o107
                           #o110 #o111 #o112 #o113 #o114 #o115 #o116 #o117
                           #o120 #o121 #o122 #o123 #o124 #o125 #o126 #o127
                           #o130 #o131 #o132 #o133 #o134 #o135 #o136 #o137
                           #o140 #o141 #o142 #o143 #o144 #o145 #o146 #o147
                           #o150 #o151 #o152 #o153 #o154 #o155 NONE NONE
                           ))
    (define-syntax inc! ;; used for foo++
      (syntax-rules ()
        ((_ x)
         (let ((v x))
           (set! x (+ x 1))
           v))))
    (define (decode-byte b)
      "Return a list of one or two bytes"
      (when *debug-unpack*
        (format #t "decode-byte: ~x at ~x~%" b (- incnt 1)))
      (if (eof-object? b)
          b
          (begin
            (when (>= b #o360)
              (error "invalid input file, char>0360 inside encoded word."))
            (let ((b0 (vector-ref first b))
                  (b1 (vector-ref second b)))
              (if (= b1 NONE)
                  (list b0)
                  (list b0 b1))))))
    (define (next)
      (if (>= incnt (bytevector-length bytevector))
          (eof-object)
          (bytevector-u8-ref bytevector (inc! incnt))))
    (define (outword l r)
      (when *debug-raw*
        (debug-raw-word up_index l r))
      (vector-set! up up_index (+ (<< l 18) r))
      (set! up_index (+ up_index 1)))
    (define (flush words)
      (let ((word0 (list-ref words 0))
            (word1 (list-ref words 1))
            (word2 (list-ref words 2))
            (word3 (list-ref words 3))
            (word4 (list-ref words 4)))
        (let ((l (bitwise-ior (<< word0 11)
                              (<< word1 4)
                              (& (>> word2 3) #o17)))
              (r (bitwise-ior (<< (& word2 7) 15)
                              (<< word3 8)
                              (<< word4 1))))
          (outword l r))))
    (define (decode-high-byte c)
      (when *debug-unpack*
        (format #t "decode-high-byte: ~x at ~x~%" c (- incnt 1)))
      (let* ((word0 (& c #o17))
             (word1 (next))
             (word2 (next))
             (word3 (next))
             (word4 (next)))
        (outword (bitwise-ior (<< word0 14)
                              (<< word1 6)
                              (& (>> word2 2) #o77))
                 (bitwise-ior (<< (& word2 3) 16)
                              (<< word3 8)
                              word4))))
    (let loop ()
      (when *debug-unpack*
        (format #t "incnt: ~d, up_index: ~a~%" incnt up_index))
      (if (>= incnt (bytevector-length bytevector))
          (vector-copy up 0 up_index)
          (let ((c (next)))
            (if (>= c #o360)
                (decode-high-byte c)
                (let lp ((bytes (decode-byte c)))
                  (when *debug-unpack*
                    (format #t "lp: bytes: ~a~%" bytes))
                  (cond ((< (length bytes) 5)
                         (let ((n (decode-byte (next))))
                           (if (eof-object? n)
                               (lp (append bytes (make-list (- 5 (length bytes)) #o03)))
                               (lp (append bytes n)))))
                        ((> (length bytes) 5)
                         (flush (take bytes 5))
                         (lp (append (drop bytes 5) (decode-byte (next)))))
                        (else
                         (flush bytes)))))
            (loop))))))

(define (print-raw filename)
  (let ((previous *debug-raw*))
    (set! *debug-raw* #t)
    (unpack (read-binary-file filename))
    (set! *debug-raw* previous)))

(define (word->7bit-ascii word)
  (list (integer->char (>> word (- 36 7)))
        (integer->char (& (>> word (- 36 7 7)) #x7f))
        (integer->char (& (>> word (- 36 7 7 7)) #x7f))
        (integer->char (& (>> word (- 36 7 7 7 7)) #x7f))
        (integer->char (& (>> word (- 36 7 7 7 7 7)) #x7f))))
(define (integer->9bitchar n)
  (let ((bucky-bits (>> n 7))
        (char (integer->char (& n #x7f))))
    (if (zero? bucky-bits)
        (list char)
        `(#\< ,@(if (bitwise-bit-set? bucky-bits 1) '(#\M #\-) '()) ,@(if (bitwise-bit-set? bucky-bits 0) '(#\C #\-) '()) ,char #\>))))
(define (word->9bit-ascii word)
  (append (integer->9bitchar (>> word (- 36 9)))
          (integer->9bitchar (& (>> word (- 36 9 9)) #x1ff))
          (integer->9bitchar (& (>> word (- 36 9 9 9)) #x1ff))
          (integer->9bitchar (& (>> word (- 36 9 9 9 9)) #x1ff))))
(define (word->6bit-ascii word)
  (define (c b)
    (if (zero? b)
        b
        (+ b #o40)))
  (list (integer->char (c (>> word (- 36 6))))
        (integer->char (c (& (>> word (- 36 6 6)) #x3f)))
        (integer->char (c (& (>> word (- 36 6 6 6)) #x3f)))
        (integer->char (c (& (>> word (- 36 6 6 6 6)) #x3f)))
        (integer->char (c (& (>> word (- 36 6 6 6 6 6)) #x3f)))
        (integer->char (c (& (>> word (- 36 6 6 6 6 6 6)) #x3f)))))
(define (parse-asciiz9 words index)
  "Read a 9-bit ascii zero-terminated string from 36-bit WORDS vector starting at offset INDEX. Return (new-index . string)."
  (let loop ((chars '())
             (i 0))
    (let ((c (word->9bit-ascii (vector-ref words (+ index i)))))
      (if (eq? #\nul (car (last-pair c)))
          (values (+ index i 1) (list->string (delete #\nul (append chars c))))
          (loop (append chars c) (+ i 1))))))
(define (parse-asciiz7 words index)
  "Read a 7-bit ascii zero-terminated string from 36-bit WORDS vector starting at offset INDEX. Return (new-index . string)."
  (let loop ((chars '())
             (i 0))
    (let ((c (word->7bit-ascii (vector-ref words (+ index i)))))
      (if (eq? #\nul (list-ref c 4))
          (values (+ index i 1) (list->string (delete #\nul (append chars c))))
          (loop (append chars c) (+ i 1))))))
(define (parse-asciiz7-list words index)
  "Read a zero-terminated list of 7-bit ascii zero-terminated string from 36-bit WORDS vector starting at offset INDEX. Return (new-index . strings)."
  (let loop ((res '())
             (i index))
    (if (zero? (vector-ref words i))
        (values (+ i 1) (reverse res))
        (let-values (((new-index word) (parse-asciiz7 words i)))
          (loop (cons word res) new-index)))))
(define (parse-asciiz6 words index)
  "Read a 6-bit ascii zero-terminated string from 36-bit WORDS vector starting at offset INDEX. Return (new-index . string)."
  (let loop ((chars '())
             (i 0))
    (let ((c (word->6bit-ascii (vector-ref words (+ index i)))))
      (if (eq? #\nul (list-ref c 5))
          (values (+ index i 1) (list->string (delete #\nul (append chars c))))
          (loop (append chars c) (+ i 1))))))
(define (parse-asciiz6-list words index)
  "Read a zero-terminated list of 6-bit ascii zero-terminated string from 36-bit WORDS vector starting at offset INDEX. Return (new-index . strings)."
  (let loop ((res '())
             (i index))
    (if (zero? (vector-ref words i))
        (values (+ i 1) (reverse res))
        (let-values (((new-index word) (parse-asciiz6 words i)))
          (loop (cons word res) new-index)))))
(define (int18 n)
  (if (not (zero? (& n (<< 1 17))))
      (- (bitwise-ior #xfffc0000 n) (expt 2 32))
      n))
(define (uint18 n)
  (& n #x3ffff))
(define (2int18 word)
  (let ((high (int18 (>> word 18)))
        (low (int18 (& word #x3ffff))))
    (values high low)))
(define (2uint18 word)
  (let ((high (uint18 (>> word 18)))
        (low (uint18 (& word #x3ffff))))
    (values high low)))
(define (read-intlistz words index)
  (let loop ((res '())
             (i 0))
    (let ((n (vector-ref words (+ index i))))
      (if (zero? n)
          (values (+ index i 1) (reverse res))
          (loop (cons n res) (+ i 1))))))
;;;; suds drw
(define param:version (make-parameter #f))
(define (parse-suds-file filename)
  (parameterize ((param:file filename))
    (parse-suds (unpack (read-binary-file filename)))))
(define (parse-suds words)
  (let*-values (((p header) (parse-header words)))
    (parameterize ((param:version (get header 'version)))
      (let*-values (((p body-def) (parse-body-def words p))
                    ((p macro) (parse-macro words p))
                    ((p body) (parse-body words p))
                    ((p points) (parse-points words p))
                    ((p set-center) (parse-set-center words p))
                    ((p trailer) (parse-trailer words p)))
        (list 'header header 'body-def body-def 'macro macro 'body body
              'points points 'set-center set-center 'trailer trailer)))))
;;;; header
(define (parse-header words)
  (when *debug-structure*
    (format #t "header ~a~%" 0))
  (let*-values (((version) (vector-ref words 0))
                ((p nomenclature-type) (parse-asciiz7 words 1))
                ((p board-type) (parse-asciiz7 words p))
                ((p type-names) (parse-asciiz7-list words p))
                ((p filespecs) (parse-asciiz6-list words p)))
    (values p (list 'version version 'nomenclature-type nomenclature-type 'board-type board-type 'type-names type-names 'filespecs filespecs))))
;;;; macro
(define (parse-macro words index)
  (when *debug-structure*
    (format #t "macro ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (zero? (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let*-values (((p name) (parse-asciiz7 words p))
                      ((p body) (parse-asciiz9 words p)))
          ;;(format #t "macro ~a: ~a~%" name body)
          (loop (cons (list name body) res) p)))))
;;;; body-def
(define (parse-body-def words index)
  (when *debug-structure*
    (format #t "body-def index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (zero? (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let-values (((p elem) (parse-body-def-element words p)))
          (loop (cons elem res) p)))))
(define different-body-def-bits '())
(define (parse-body-def-element words p)
  (when *debug-structure*
    (format #t "body-def-element index ~a~%" (* p 2)))
  (let*-values (((p name) (parse-asciiz7 words p))
                ((p package) (if (>= (param:version) #o27) (parse-asciiz7 words p) (values p #f)))
                ((bits) (vector-ref words p))
                ((loc-offset-x loc-offset-y) (2int18 (vector-ref words (+ p 1))))
                ((char-offset-x char-offset-y) (2int18 (vector-ref words (+ p 2))))
                ((p pins) (parse-body-def-elem-pins words (+ p 3)))
                ((p lines) (parse-body-def-elem-lines words p))
                ((p props) (parse-props words p)))
    (unless (memq bits different-body-def-bits)
      (set! different-body-def-bits (cons bits different-body-def-bits)))
    (values p (list 'name name
                    'package package
                    'bits bits
                    'offset (cons loc-offset-x loc-offset-y)
                    'char-offset (if (and (zero? char-offset-x) (= char-offset-y -131072))
                                     (cons 0 0)
                                     (cons char-offset-x char-offset-y))
                    'pins pins 'lines lines 'props props))))
(define different-body-def-pin-bits '())
(define (parse-body-def-elem-pins words index)
  (when *debug-structure*
    (format #t "body-def-elem-pins index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (= #o400000 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let*-values (((loc-x loc-y) (2int18 (vector-ref words p)))
                      ((bits pinid) (2uint18 (vector-ref words (+ p 1))))
                      ((pos name) (2uint18 (vector-ref words (+ p 2)))))
          (let ((position (case (& pos #o7) ;; taken from its-vault/files/draw/edit.500::301
                            ((0) 'up-right)
                            ((1) 'up)
                            ((2) 'up-left)
                            ((3) 'left)
                            ((4) 'down-left)
                            ((5) 'down)
                            ((6) 'down-right)
                            ((7) 'right)
                            (else
                             (format #t "unknown pin position: ~a ~a ~a~%" pos (param:file) (+ p 2))
                             pos))))
            (loop (cons (list 'loc (cons loc-x loc-y) 'bits bits 'bits-decoded (decode-pin-bits bits) 'pinid pinid 'pos position 'name name) res) (+ p 3)))))))
(define (parse-body-def-elem-lines words index)
  (when *debug-structure*
    (format #t "body-def-elem-lines index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (= #o400000 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let*-values (((a b) (2int18 (vector-ref words p))))
          (loop (cons (cons a b) res) (+ p 1))))))

;;;; body
(define (parse-body words index)
  (when *debug-structure*
    (format #t "body index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (= #o400000 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let-values (((p elem) (parse-body-element words p)))
          (loop (cons elem res) p)))))
(define (parse-connector-pin-block-pointer n)
  (let ((a (>> n 15))
        (b (& (>> n 12) #o7))
        (c (& (>> n 9) #o7))
        (d (& n #o777)))
    (string-append (number->string a)
                   (string (integer->char (+ (- (char->integer #\A) 1) b)))
                   "J"
                   (number->string (+ c 1))
                   "-"
                   (number->string d))))
(define (parse-card-body-loc n)
  (let ((number (integer->char (+ (char->integer #\0) (& (>> n 15) 7))))
        (letter (integer->char (+ (- (char->integer #\A) 1) (& (>> n 12) 7))))
        (num (format #f "~2,'0d" (& (>> n 6) #o77))))
    (string-append (string number) (string letter) num)))
(define different-body-bits '())
(define (decode-bits n defs)
  "Decode 18 bit N according to DEFS, (bit-number . symbol-name)"
  (let loop ((i 0)
             (res '()))
    (if (> i 17)
        (reverse res)
        (if (bitwise-bit-set? n i)
            (let ((q (assq i defs)))
              (if q
                  (loop (+ i 1)
                        (cons (cdr q) res))
                  (begin
                    (format #t "WARNING: no bit definition for ~a in ~a~%" i defs)
                    (loop (+ i 1)
                          (cons i res)))))
            (loop (+ i 1)
                  res)))))
(define (decode-body-bits bits)
  (unless (memq bits different-body-bits)
    (set! different-body-bits (cons bits different-body-bits)))
  (decode-bits bits '((0 . l1416)    ; LEFT JUSTIFIED 14 PIN DIP IN 16 PIN SOCKET
                      (1 . r1416)    ; RIGHT    "      "  "   "   "  "  "     "
                      (2 . fixloc)   ; ALWAYS SET BODY LOC OFFSET FROM DEFINITION
                      (3 . fixblo))) ; FIX LOC CHAR OFFSET WHEN LOC CHANGES
  )
(define (decode-pin-bits bits)
  (unless (memq bits different-body-def-pin-bits)
    (set! different-body-def-pin-bits (cons bits different-body-def-pin-bits)))
  (decode-bits bits '((0 . assh)
                      (1 . assl)
                      (13 . dptmp2)
                      (14 . dptmp1)
                      (15 . foundd)
                      (16 . available)
                      (17 . bussed)))
  )
(define (parse-body-element words index)
  (when *debug-structure*
    (format #t "body-element index ~a~%" (* index 2)))
  (let*-values (((body-loc-x body-loc-y) (2int18 (vector-ref words index)))
                ((orientation) (vector-ref words (+ index 1)))
                ;; (dummy (if (not (zero? (& orientation #o377777))) (format #t "orientation: ~a~%" orientation)))
                ((card-body-loc) (if (zero? (& orientation #o400000)) #f (parse-card-body-loc (vector-ref words (+ index 2)))))
                ((const-offset-x const-offset-y) (if (zero? (& orientation #o400000)) (values #f #f) (2int18 (vector-ref words (+ index 3)))))
                ((char-offset-x char-offset-y) (if (zero? (& orientation #o400000)) (values #f #f) (2int18 (vector-ref words (+ index 4)))))
                ((p) (if (zero? (& orientation #o400000)) (+ index 2) (+ index 5)))
                ((bits id) (2uint18 (vector-ref words p)))
                ((p) (+ p 1))
                ((p name) (parse-asciiz7 words p))
                ;;(dummy (format #t "name: ~a~%" name))
                ((p props) (parse-props words p)))
    (values p (list 'loc (cons body-loc-x body-loc-y)
                    'orientation orientation
                    'card-body-loc card-body-loc
                    'offset (if (and const-offset-x const-offset-y)
                                (cons const-offset-x const-offset-y)
                                #f)
                    'char-offset (if (and char-offset-x char-offset-y)
                                     (cons char-offset-x char-offset-y)
                                     #f)
                    'bits bits
                    'bits-decoded (decode-body-bits bits)
                    'id id
                    'name name
                    'props props))))
(define (parse-props words index)
  (when *debug-structure*
    (format #t "props index ~s~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (= 0 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let*-values (((p text) (parse-asciiz7 words p))
                      ((p name) (parse-asciiz7 words p))
                      ;;(dummy (format #t "text: ~a name: ~a~%" text name))
                      ((unknown text-size) (2uint18 (vector-ref words p)))
                      ((text-loc-x text-loc-y) (2int18 (vector-ref words (+ p 1))))
                      ((const-offset-x const-offset-y) (2int18 (vector-ref words (+ p 2))))
                      ;; (dummy (format #t "text-size: ~a text-loc-x ~a text-loc-y ~a const-offset-x ~a const-offset-y ~a~%" text-size text-loc-x text-loc-y const-offset-x const-offset-y))
                      )
          (loop (cons (list 'name name 'text text 'unknown unknown 'text-size text-size 'text-loc (cons text-loc-x text-loc-y) 'offset (cons const-offset-x const-offset-y)) res) (+ p 3))))))
;;;; pins
(define different-point-bits '())
(define (parse-point-bits-data words index bits textsize0 textsize1)
  (unless (memq bits different-point-bits)
    (set! different-point-bits (cons bits different-point-bits)))
  ;; see its-vault/files/draw/first.521::409
  ;; new guess upon reading out.318: offset+name is written if text-size is not 0, not depending on bits... TODO: implement and test
  ;; however, connector pin information *is* written depending on bits (CPIN__1000) 2 words: cpin block pointer; x,y constant offset
  (case bits
    ((#o404000) ;; occurs in chodt1
     (values index '())
     )
    ((#o040000) ;; FIXTXT__40000
     (let*-values (((x-const-offset y-const-offset) (2int18 (vector-ref words index)))
                   ((p name) (parse-asciiz7 words (+ index 1))))
       (values p (list 'name name 'offset (cons x-const-offset y-const-offset)))))
    ;; ((#o200000)
    ;;  (if (and (zero? textsize0) (zero? textsize1))
    ;;      (let*-values (((ioloc0 ioloc1) (2int18 (vector-ref words index)))
    ;;                    ((const-offset-x const-offset-y) (2int18 (vector-ref words (+ index 1)))))
    ;;        (values (+ index 2) (list 'ioloc0 ioloc0 'ioloc1 ioloc1 'const-offset-x const-offset-x 'const-offset-y const-offset-y)))
    ;;      (values index '())))
    ((#o200000 #o240000)
     (if (and (zero? textsize0) (zero? textsize1))
         (values index '())
         (let*-values (((loc-x loc-y) (2int18 (vector-ref words index)))
                       ((p name) (parse-asciiz7 words (+ index 1))))
           (values p (list 'name name 'offset (cons loc-x loc-y))))))
    ((0)
     (if (zero? textsize1)
         (values index '())
         (let*-values (((x-const-offset y-const-offset) (2int18 (vector-ref words index)))
                       ((p name) (parse-asciiz7 words (+ index 1))))
           (values p (list 'name name 'offset (cons x-const-offset y-const-offset))))))
    ((#o1000 #o11000) ;; #o1000 = connector pin, #o10000 = fix connector to text
     (values (+ index 2) `(connector-pin-block-pointer ,(parse-connector-pin-block-pointer (vector-ref words index)) loc ,(let-values (((x y) (2int18 (vector-ref words (+ index 1))))) (cons x y)))))
    (else
     (error "don't know how to read bits" bits index))))
(define (parse-point-element words index)
  (when *debug-structure*
    (format #t "point-element index ~a~%" (* index 2)))
  (let*-values (((loc-x loc-y) (2int18 (vector-ref words index)))
                ((id-a id-b) (2uint18 (vector-ref words (+ index 1))))
                ((d0 d1) (2uint18 (vector-ref words (+ index 2)))) ;; d1/u1/l1/r1 reference body id
                ((u0 u1) (2uint18 (vector-ref words (+ index 3)))) ;; d0/u0/l0/r0 reference pin counting from bottom up starting with 1
                ((l0 l1) (2uint18 (vector-ref words (+ index 4))))
                ((r0 r1) (2uint18 (vector-ref words (+ index 5))))
                ((bits pinname) (2uint18 (vector-ref words (+ index 6))))
                ((textsize0 textsize1) (2uint18 (vector-ref words (+ index 7))))
                ((p bits-data) (parse-point-bits-data words (+ index 8) bits textsize0 textsize1)))
    (values p (list 'loc (cons loc-x loc-y)
                    'id (cons id-a id-b)
                    'd (if (and (zero? d0) (zero? d1)) #f (cons d0 d1))
                    'u (if (and (zero? u0) (zero? u1)) #f (cons u0 u1))
                    'l (if (and (zero? l0) (zero? l1)) #f (cons l0 l1))
                    'r (if (and (zero? r0) (zero? r1)) #f (cons r0 r1))
                    'body (if (zero? id-a) #f id-b)
                    'bits bits
                    'pinname pinname
                    'textsize0 textsize0 'textsize1 textsize1
                    'bits-data bits-data))))
(define (parse-points words index)
  (when *debug-structure*
    (format #t "points index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    (if (= #o400000 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let-values (((p elem) (parse-point-element words p)))
          (loop (cons elem res) p)))))
;;;; set-center
(define (parse-set-center words index)
  (when *debug-structure*
    (format #t "set-center index ~a~%" (* index 2)))
  (let loop ((res '())
             (p index))
    ;;    (format #t "set-center loop p ~a~%" p) (flush-output-port)
    (if (= #o400000 (vector-ref words p))
        (values (+ p 1) (reverse res))
        (let*-values (((loc-x loc-y) (2int18 (vector-ref words p)))
                      ((p body-ids) (read-intlistz words (+ p 1)))
                      ((p point-ids) (read-intlistz words p)))
          (loop (cons (list 'loc (cons loc-x loc-y) 'body-ids body-ids 'point-ids point-ids) res) p)))))
;;;; trailer
(define (parse-trailer words index)
  (when *debug-structure*
    (format #t "trailer index ~a~%" (* index 2)))
  (let*-values (((p drawn-by) (parse-asciiz7 words index))
                ((p title-line-1) (parse-asciiz7 words p))
                ((p title-line-2) (parse-asciiz7 words p)))
    (values p (list drawn-by title-line-1 title-line-2))))
;;;; ndips.dip
(define (find-dip ndips name)
  (find (lambda (el) (string=? name (get el 'name))) ndips))
(define (parse-ndips-file filename)
  (parse-ndips (unpack (read-binary-file filename))))
(define (parse-ndips words)
  (unless (= #o777777777773 (vector-ref words 0))
    (error "no idea how to read version" (vector-ref words 0)))
  (let loop ((p 1)
             (res '()))
    (let-values (((p elem) (parse-ndips-element words p)))
      (if (zero? (vector-ref words p))
          (reverse res)
          (loop p (cons elem res))))))
(define (parse-ndips-element words p)
  ;; see body.500 from line 790
  (let*-values (((pins) (vector-ref words p))
                ((p name) (parse-asciiz7 words (+ p 1)))
                ((p package) (parse-asciiz7 words p))
                ((pins-data) (map (lambda (index) (parse-ndips-element-pin words (+ p (* index 5))))
                                  (iota pins))))
    (values (+ p 2 (* pins 5))
            (list 'name name 'package package 'pins pins-data))))
(define (parse-ndips-element-pin words p)
  (let*-values (((dummy name) (2uint18 (vector-ref words p)))
                ((bits pin-swapping/sharing-number) (2uint18 (vector-ref words (+ p 1))))
                ((hi lo) (2int18 (vector-ref words (+ p 2))))
                ((sixbit/use)  (vector-ref words (+ p 3)))
                ((sect-bits sect-pin-num) (2uint18 (vector-ref words (+ p 4)))))
    (list 'name name 'bits bits 'pin-swapping/sharing-number pin-swapping/sharing-number 'hi hi 'lo lo
          'sixbit/use sixbit/use 'sect-bits sect-bits
          'sect-pin-num sect-pin-num)))
;;;; almost surely based on package type somehow...
(define +default-pin-suffix+ "" ;;"?"
  )
(define +pin-type+ '(("≡" . ("74S00" "74S00O" "74S04" "74S04A" "74S08" "74S08O"
                             "74S11" "74S32" "74S32O" "74S37" "74S02"
                             "74S02O" "74S10O" "74S10" "74S20" "7428"
                             "TD100" "TD50" "TD25" "74S64"
                             "74S51" "74S280" "74S86" "74S32"
                             "74S74" "74LS14" "74S20O" "74S11O" "74S260")) ;; 14 pin
                     (":" . ( "74S181" "74S182" "74S175" "93S48"
                              "74S194"  "25S07" "82S21" "74S169" "74S153"
                              "25S09" "74S174" "93S46" "74S258" "93425A" "SIP330/470-8"
                              "SIP220/330-8" "74S151" "74S133" "IM5610" "74S139" "9S42"
                              "74S283" "74S157" "5600" "16DUMMY" "74LS109"
                              "9328" "25S10" "74S138" "9S42-1" "74S133O")) ;; 16 pin, 24 pin mit adaptor, 8 pin SIP
                     ("" . ("RES20" "74S373" "74S241" "74S374" "25LS2519" "74LS244"
                            "74S472" "74S240"
                            ;; NODE for advent
                            "NODE"
                            ;; ARROW for chod1
                            "ARROW")) ;; 20 pin
                     ("+" . ("2147" "TIL309"))) ;; 18 pin
  )
;;;; util
(define (show-details body points all-defs)
  (pp body)
  (pp (get-pin-of-body-points body points))
  (pp (find-body-def (get body 'name) all-defs)))
(define (get-body-def all-defs body)
  (let* ((name (if (string? body) body (get body 'name)))
         (def (find-body-def name all-defs)))
    def))
(define (get-body id bodies)
  (find (lambda (b) (if (number? id)
                        (= (get b 'id) id)
                        (string=? id (get b 'card-body-loc))))
        bodies))
(define (get-pin-of-body-points body points)
  (let ((id (if (integer? body) body (get body 'id))))
    (filter (lambda (p) (= (or (get p 'body) -1) id)) points)))
(define (find-body-def def-name all-defs)
  (or (find (lambda (el)
              (string-ci=? (get el 'name) def-name))
            all-defs)
      (error "no definition found with name" def-name)))
(define (find-body-def-pin all-defs bodies body-id pinid)
  (let ((body (find (lambda (b)
                      (= body-id (get b 'id)))
                    bodies)))
    (if (not body)
        (error "no body with id found" body-id bodies))
    (let ((def (get-body-def all-defs body)))
      (let ((pins (get def 'pins)))
        (find (lambda (p)
                (= pinid (get p 'pinid)))
              pins)))))
;;;; lines/points
(define (lines->svg lines)
  `(path (@ (d ,(apply string-append (map (lambda (el) (let* ((x (car el))
                                                              (yt (cdr el))
                                                              (inv? (bitwise-bit-set? yt 0))
                                                              (y (& yt (bitwise-not 1))))
                                                         (if inv?
                                                             (format #f "M ~a ~a" x (- y))
                                                             (format #f "L ~a ~a" x (- y)))))
                                          lines)))
            (fill "none")
            (stroke "black"))))
(define (props->svg props)
  `(g ,@(map prop->svg props)))
(define (get plist indicator) "Look up PLIST's INDICATOR property."
  (let loop ((l plist))
    (if (null? l)
        #f
        (if (eq? (car l) indicator)
            (cadr l)
            (loop (cddr l))))))

(define (sanitize-text str)
  (string-replace-string-all (string-replace-string-all (string-replace-string-all (string-replace-string-all (string-replace-string-all (string-replace-string-all (string-replace-string-all str "" "∨") "" "∧") "^" "↑") "" "¬") "_" "←") "" "↓") "" "→"))

(define next-link-number!
  (let ((n 0))
    (lambda () (set! n (+ n 1)) n)))
(define links '())
(define all-files '())
(define-record-type :link
  (%make-link page body-name card-body-loc general-name name number input/output)
  link?
  (page link-page) ;; filename on which this signal appears
  (body-name link-body-name) ;; body it is connected to
  (card-body-loc link-card-body-loc) ;; card-body-loc it is connected to
  (general-name link-general-name) ;; the name for the "general symbol" (including negation)
  (name link-name) ;; the id (same for X and -X)
  (number link-number) ;; the unique number for exactly *this* instance
  (input/output link-input/output) ;; 'input or 'output
  )
(define (make-link name content input/output)
  (let ((general-name (string-replace-string-all (if (char=? (string-ref name 0) #\-) (substring name 1 (string-length name)) name) " " "_"))
        (name (string-replace-string-all (if (char=? (string-ref name 0) #\-) (string-append "n" (substring name 1 (string-length name))) name) " " "_"))
        (num (next-link-number!)))
    (set! links (cons (%make-link (param:page) (param:body-name) (param:card-body-loc) general-name name num input/output) links))
    `(a (@ ;; (xlink:href ,(format #f "links.html#~a" id))
         (class ,(format #f "linkDialog~a signal signal~a" general-name general-name))
         (data-signal ,(format #f "signal~a" general-name))
         (id ,(format #f "~a~a" name num)))
        ,content)))
(define (signal-tooltip general-name)
  (let ((q (assoc general-name *tooltips*)))
    (if q
        (cdr q)
        (let loop ((tts *tooltips*))
          (if (null? tts)
              #f
              (let ((tt (car tts)))
                (if (and (char=? (string-ref (car tt) (- (string-length (car tt)) 1)) #\*) ;; last char == *
                         (string-prefix? (substring (car tt) 0 (- (string-length (car tt)) 1)) general-name))
                    (cdr tt)
                    (loop (cdr tts)))))))))
(define (text->svg x y lines position body? input/output)
  (if (or (null? lines) (and (= (length lines) 1)
                             (string=? (car lines) "")))
      #f
      (let ((lines-adjust (/ (- (length lines) 1) 2)))
        (if (= (length lines) 1)
            (let* ((name (car lines))
                   (is-negated? (if name (char=? #\- (string-ref name 0)) #f))
                   (nam (if is-negated? (substring name 1 (string-length name)) name))
                   (n (if nam nam "" ;; (if (zero? pinname) "" pinname)
                          ))
                   (t `(text (@ (x ,x)
                                (y ,y)
                                (text-anchor ,(if position (position->anchor position) (error "no position given for text" lines)))
                                (dominant-baseline ,(if position (position->dominant-baseline position) (error "no position given for text" lines)))
                                ,@(if is-negated? '((text-decoration "overline")) '()))
                             ,(let ((tt (signal-tooltip nam)))
                                (if tt
                                    `(title ,tt)
                                    #f))
                             ,n)))
              (if (and nam (not body?)) ;; only link for non-body
                  (if (param:make-links?) (make-link name t input/output) t)
                  t))
            `(g (text (@ (x ,x)
                         (y ,y)
                         (text-anchor "middle")
                         (dominant-baseline "central")
                         )
                      ,@(map (lambda (n i)
                               (let* ((is-negated? (and (> (string-length n) 0)
                                                        (char=? #\- (string-ref n 0))))
                                      (n (if is-negated? (substring n 1 (string-length n)) n)))
                                 `(tspan (@ (x ,x)
                                            (dy ,(if (> i 0) "1.1em" (format #f "-~aem" (* lines-adjust 1.1))))
                                            ,@(if is-negated? '((text-decoration "overline")) '()))
                                         ,n)))
                             lines
                             (iota (length lines)))))))))
(define (prop->svg prop)
  (let* ((name (burst-string (sanitize-text (get prop 'text)) #\x17 #f))
         (text-size (get prop 'text-size))
         (text-loc (get prop 'text-loc))
         (text-loc-x (car text-loc))
         (text-loc-y (cdr text-loc))
         (offset (get prop 'offset))
         (offset-x (car offset))
         (offset-y (cdr offset))
         (ax text-loc-x)
         (ay (- text-loc-y))
         (x (+ text-loc-x )) ; const-offset-x
         (y (- (+ text-loc-y )))) ; const-offset-y
    (if (> text-size 0)
        (text->svg x y name 'none #t #f)
        #f)))
(define (pin->svg pin)
  (let* ((loc (get pin 'loc))
         (loc-x (car loc))
         (loc-y (cdr loc))
         (name (get pin 'name))
         (bits (get pin 'bits))
         (pos (get pin 'pos))
         (x loc-x)
         (y (- loc-y)))
    `(g ;; (circle (@ (cx ,x)
      ;;            (cy ,y)
      ;;            (r 3)
      ;;            (fill ,(case pos
      ;;                     ((0) "yellow")
      ;;                     ((2) "green")
      ;;                     (else "red"))))
      ;;         (title ,(format #f "~a" pin)))
      )))
;; fonts:
;; Bitstream Vera Sans Mono
;; Consolas
;; Cousine
;; Input Mono
;; Liberation Mono
;; Monoid
;; Source Code Pro
(define (svg-out filename svg-data)
  (let ((svg `(svg (@ (height 1000)
                      (width 1800)
                      (id "svg")
                      ;; (viewBox "-800 -400 1500 1000")
                      (xmlns "http://www.w3.org/2000/svg")
                      (xmlns:svg "http://www.w3.org/2000/svg")
                      (xmlns:xlink "http://www.w3.org/1999/xlink")
                      (version "1.1"))
                   (style "
text { font: normal 7pt \"Consolas\"; }
a.highlightSignal text { fill: #900; font-size: 0.8em; }"
                     )
                   ,svg-data)))
    (if filename
        (with-output-to-file filename
          (lambda () (sxml->xml
                      svg
                      #t
                      #t))
          'replace)
        svg)))
(define (pins->svg pins)
  `(g ,@(map pin->svg pins)))

(define (def->svgfile def-name all-defs)
  (svg-out (string-append "/tmp/" (string-replace-string-all def-name "/" "-") ".svg")
           (def->svg def-name all-defs)))
(define (def->svg def-name all-defs)
  (let ((def (find-body-def def-name all-defs)))
    `(g ,(lines->svg (get def 'lines))
        ,(props->svg (get def 'props))
        ,(pins->svg (get def 'pins)))))
(define (position->anchor position)
  (case position
    ;;((#f) "middle")
    ((up-left left down-left point-left) "end")
    ((up-right right down-right point-right) "start")
    (else "middle")))
(define (position->dominant-baseline position)
  (case position
    ;;((#f) "middle")
    ((up-left up up-right point-up) "auto")
    ((down-left down down-right point-down) "hanging")
    (else
     "middle")))
(define (adjust-loc loc position)
  (let ((x (car loc))
        (y (cdr loc)))
    (case position
      ((left point-left) (cons (- x 1) y))
      ((up-left) (cons (- x 1) (+ y 1)))
      ((right point-right) (cons (+ x 1) y))
      ((up-right) (cons (+ x 1) (+ y 1)))
      ((up point-up) (cons x (+ y 1)))
      ((down) (cons x (- y 1)))
      ((down-right) (cons (+ x 1) (- y 1)))
      ((point-down) (cons x (- y 3)))
      (else (cons x y)))))
(define (point->svg point all-defs bodies)
  (let* ((loc (get point 'loc))
         (id (get point 'id))
         (pinname (get point 'pinname))
         (bits-data (get point 'bits-data))
         (name (if (not (null? bits-data)) (get bits-data 'name) #f))
         (offset (if (not (null? bits-data)) (get bits-data 'offset) #f))
         (l (get point 'l))
         (u (get point 'u))
         (r (get point 'r))
         (d (get point 'd))
         (junction? (> (length (filter (lambda (x) x) (list l u r d))) 2))
         (def-pin (if (zero? (car id))
                      #f
                      (find-body-def-pin all-defs bodies (cdr id) (car id))))
         (position (and def-pin (get def-pin 'pos)))
         (position (or position (cond (l 'point-right) (r 'point-left) (u 'point-down) (d 'point-up))))
         (hide-pin-name? (and def-pin (memq 'bussed (get def-pin 'bits-decoded))))
         (adj-loc (adjust-loc loc position))
         (body (let ((id (get point 'body))) (if id (find (lambda (b) (= (get b 'id) id)) bodies) #f)))
         (body-name (if body (get body 'name) #f))
         (card-body-loc (if body (get body 'card-body-loc) #f))
         (pin-suffix (if body (let ((name (get body 'name)))
                                (let ((it (find (lambda (el) (member name (cdr el))) +pin-type+)))
                                  (if it (car it) +default-pin-suffix+)))
                         ""))
         (x (car adj-loc))
         (y (cdr adj-loc))
         (extra-y-adjust 1) ;; names seem to not be exactly centered on the lines, move them down a tiny bit
         )
    (parameterize ((param:body-name body-name)
                   (param:card-body-loc card-body-loc))
      `(g ,@(if hide-pin-name? '()
                (list (text->svg (+ x ;;(if offset (car offset) 0)
                                    )
                                 (+ (- (+ y ;;(if offset (cdr offset) 0)
                                          )) (if (memq position '(point-left point-right)) extra-y-adjust 0))
                                 (if name
                                     (burst-string (sanitize-text name) #\x17 #f)
                                     (list (string-append (if (zero? pinname) "" (number->string pinname)) pin-suffix)))
                                 position
                                 body
                                 (cond (r 'input)
                                       (l 'output)
                                       (else #f)))))
          ,@(if junction?
                `((circle (@ (cx ,(- x 1))
                             (cy ,(- y))
                             (r 2))))
                '())
          ))))
(define (points->svg points all-defs bodies)
  `(g ,@(map (lambda (p)
               (point->svg p all-defs bodies))
             points)))
(define (body->svg body all-defs)
  (let* ((loc (get body 'loc))
         (x (car loc))
         (y (cdr loc))
         (name (get body 'name))
         (orientation (& (get body 'orientation) #o377777))
         (offset (or (get body 'offset) '(0 . 0)))
         (char-offset (or (get body 'char-offset) '(0 . 0)))
         (card-body-loc (or (get body 'card-body-loc) #f)))
    (format #t "  ~a ~a~%" name card-body-loc)
    (if #t ;; (and (car offset) (cdr offset))
        `(g (@ (transform ,(format #f "translate(~a,~a) rotate(~a)" x (- y) (case orientation ((0) 0) ((1) 90) ((2) 180) ((3) 270) (else (error "unknown orientation" orientation))))))
            (text (@ (x ,(car offset))
                     (y ,(- (cdr offset)))
                     (text-anchor "middle"))
                  ,card-body-loc)
            ,(parameterize ((param:body-name (get body 'name))
                            (param:card-body-loc name))
               (def->svg name all-defs))
            ,(parameterize ((param:body-name name)
                            (param:card-body-loc card-body-loc))
               (props->svg (get body 'props)))
            ;; (circle (@ (cx ,0)
            ;;            (cy ,0)
            ;;            (r 2)
            ;;            (fill "red")))
            ;; (circle (@ (cx ,(+ 0 (car offset)))
            ;;            (cy ,(- (+ 0 (cdr offset))))
            ;;            (r 2)
            ;;            (fill "green")))
            ;; (circle (@ (cx ,(+ 0 (car offset) (car char-offset)))
            ;;            (cy ,(- (+ 0 (cdr offset) (cdr char-offset))))
            ;;            (r 2)
            ;;            (fill "blue")))
            )
        '(g))))
(define (bodies->svg bodies all-defs)
  `(g ,@(map (lambda (b) (body->svg b all-defs))
             bodies)))
(define (line-to loc id points)
  (let ((p (find (lambda (p)
                   (equal? (get p 'id) id))
                 points)))
    (if (not p)
        (error "point not found" id points)
        (let ((other-loc (get p 'loc)))
          `(line (@ (x1 ,(car loc)) (y1 ,(- (cdr loc)))
                    (x2 ,(car other-loc)) (y2 ,(- (cdr other-loc)))
                    (stroke "black")
                    (stroke-linecap "round")))))))
(define (points->lines points)
  ;; only draw down and right, so as not to duplicate lines
  (append-map (lambda (p)
                (let ((loc (get p 'loc))
                      (d (get p 'd))
                      ;;(u (get p 'u))
                      ;;(l (get p 'l))
                      (r (get p 'r)))
                  (filter (lambda (x) x)
                          (list (if d (line-to loc d points) #f)
                                ;;(if u (line-to loc u points) #f)
                                ;;(if l (line-to loc l points) #f)
                                (if r (line-to loc r points) #f)))))
              points))

(define all-defs #f)
(define last-file #f)
(define points #f)
(define bodies #f)
(define body-defs #f)

(define param:page (make-parameter #f))
(define param:file (make-parameter #f))
(define param:card-body-loc (make-parameter #f))
(define param:body-name (make-parameter #f))
(define param:make-links? (make-parameter #t))

(define (drw->svg drw-file svg-filename page)
  (format #t "rendering ~a~%" page)
  (parameterize ((param:page page))
    (when (not all-defs)
      (set! all-defs (get (parse-suds-file "/home/nex/src/cadr/sys46/cadr/bodies.drw") 'body-def)))
    (set! last-file (if (string? drw-file) (parse-suds-file drw-file) drw-file))
    (set! points (get last-file 'points))
    (set! bodies (get last-file 'body))
    (set! body-defs (get last-file 'body-def))
    (let* ((all-defs (append body-defs all-defs))
           (svg `(g (@ (id "svgContent"))
                    ,(bodies->svg bodies all-defs)
                    ,(points->svg points all-defs bodies)
                    ,@(points->lines points))))
      (svg-out svg-filename svg))))

(define (io->symbol input/output)
  (case input/output
    ((input) "→input")
    ((output) "output→")
    ((#f) "?")
    (else (error "unknown input/output symbol" input/output))))
(define (maybe-overbar str)
  (if (char=? (string-ref str 0) #\n)
      `(span (@ (style "text-decoration: overline"))
             ,(substring str 1 (string-length str)))
      str))
(define (drw->html html-filename svg page previous next title subtitle all-files links)
  (let* ((incoming-links (filter (lambda (link) (string=? (link-page link) page)) links))
         (signals-on-this-page (delete-duplicates (sort string<? (map link-general-name incoming-links))))
         (outgoing-links (map (lambda (name)
                                (cons name (filter (lambda (link)
                                                     (string=? name (link-general-name link)))
                                                   links)))
                              signals-on-this-page)))
    (with-output-to-file html-filename
      (lambda ()
        (sxml->html
         `(html (head (meta (@ (charset "UTF-8")))
                      (title ,(format #f "~a – ~a" title subtitle))
                      (style "
.inline { display: inline; }
dialog a { text-decoration: none }"))
                (body (div (@ (class "inline"))
                           (a (@ (href ,(format #f "~a.html" previous))) ,(format #f "← ~a" previous))
                           " "
                           (a (@ (href ,(format #f "~a.html" next))) ,(format #f "→ ~a" next))
                           " ")
                      (h1 (@ (class "inline"))
                          ,(format #f "~a – ~a [~a]" title subtitle page))
                      (div (@ (class "inline"))
                           (form (@ (id "filenamesearchform")
                                    (class "inline"))
                                 (label (@ (for "filenamesearch")) "Find File: ")
                                 (input (@ (type "text")
                                           (id "filenamesearch")
                                           (list "filenames")))
                                 (datalist (@ (id "filenames"))
                                           ,@(map (lambda (f)
                                                    (let ((n (substring (car f) 0 (- (string-length (car f)) 4)))) ;; remove .drw
                                                      `(option (@ (value ,n)))))
                                                  all-files))
                                 (input (@ (type "submit")
                                           (formmethod "get")
                                           (value "Go"))))
                           (form (@ (id "pinnamesearchform")
                                    (class "inline"))
                                 (label (@ (for "pinnamesearch")) "Find Pin: ")
                                 (input (@ (id "pinnamesearch")
                                           (type "text")
                                           (list "pinnames")))
                                 (datalist (@ (id "pinnames"))
                                           ,@(map (lambda (link)
                                                    `(option (@ (value ,(format #f "~a – ~a (~a) [~a]" (link-page link) (link-name link) (io->symbol (link-input/output link)) (link-number link))))))
                                                  (sort (lambda (a b)
                                                          (string<? (link-general-name a) (link-general-name b)))
                                                        links)))
                                 (input (@ (type "submit")
                                           (formmethod "get")
                                           (value "Go")))))
                      (div ,svg)
                      ,@(if (param:make-links?)
                            (map (lambda (data)
                                   (let ((name (car data))
                                         (links (cdr data)))
                                     `(div (dialog (@ (id ,(format #f "dialog~a" name)))
                                                   (h3 "This page:")
                                                   (form
                                                    (ul ,@(map (lambda (link)
                                                                 `(li (a (@ (class ,(format #f "closeDialog~a" name))
                                                                            (href ,(format #f "~a.html#~a~a" (link-page link) (link-name link) (link-number link))))
                                                                         ,(link-page link) " – " ,(maybe-overbar (link-name link)) " (" ,(io->symbol (link-input/output link)) ")")))
                                                               (filter (lambda (link) (string=? page (link-page link)))
                                                                       links)))
                                                    (h3 "Other pages:")
                                                    (ul ,@(map (lambda (link)
                                                                 `(li (a (@ (href ,(format #f "~a.html#~a~a" (link-page link) (link-name link) (link-number link))))
                                                                         ,(link-page link) " – " ,(maybe-overbar (link-name link)) " (" ,(io->symbol (link-input/output link)) ")")))
                                                               (filter (lambda (link) (not (string=? page (link-page link))))
                                                                       links)))
                                                    (button (@ (value "cancel")
                                                               (formmethod "dialog"))
                                                            "Cancel")))
                                           (script (*html* ,(format #f "
addEventListener('DOMContentLoaded', (event) => {
  const dialog = document.getElementById('dialog~a');
  const linkDialogs = document.getElementsByClassName('linkDialog~a');
  const closeDialogs = document.getElementsByClassName('closeDialog~a');
  dialog.addEventListener('click', () => { dialog.close(); });
  Array.from(linkDialogs).forEach((linkDialog) => {
    linkDialog.addEventListener('click', () => {
      dialog.showModal();
    });
  });
  Array.from(closeDialogs).forEach((closeDialog) => {
    closeDialog.addEventListener('click', () => {
      dialog.close();
    });
  });

});
" name name name))))
                                     ))
                                 outgoing-links)
                            '()))
                (script (*html*
                         ,(if (param:make-links?)
                              (format #f "
function gofilesearch(event) {
  console.log('gofilesearch');
  var dest = document.getElementById('filenamesearch').value + '.html';
  console.log(dest);
  location.href=dest;
  event.preventDefault();
}
function gopinsearch(event) {
  console.log('pinfilesearch');
  const val = document.getElementById('pinnamesearch').value;
  console.log(val);
  const regex = /(.*) – (.*) \\(.* \\[(.*)\\]/;
  const match = regex.exec(val);
  console.log(match);
  const dest = match[1] + '.html#' + match[2] + match[3];
  console.log(dest);
  location.href = dest;
  event.preventDefault();
}
function leavesignal(event) {
  const signal = event.target.dataset.signal;
  const signals = document.getElementsByClassName(signal);
  Array.from(signals).forEach((s) => { s.classList.remove('highlightSignal'); });
}
function entersignal(event) {
  const signal = event.target.dataset.signal;
  const signals = document.getElementsByClassName(signal);
  Array.from(signals).forEach((s) => { s.classList.add('highlightSignal'); });

}
function hashchanged(event) {
  console.log(event)
  if(event) {
    const old = event.oldURL.split('#')[1];
    document.getElementById(old).style.fill = 'black';
  }
  const h = window.location.hash.substr(1);
  if(h) {
    const target = document.getElementById(h);
    if(target) {
      target.style.fill = 'red';
    }
  }
}
function keyuphandler(event) {
  console.log(event);
  if(event.key === 'ArrowLeft' && !event.shiftKey && !event.metaKey && !event.ctrlKey && !event.altKey) {
    // previous
    const target = '~a.html'
    console.log('key pressed, going to ' + target);
    location.href = target;
  } else if(event.key === 'ArrowRight' && !event.shiftKey && !event.metaKey && !event.ctrlKey && !event.altKey) {
    // next
    const target = '~a.html'
    console.log('key pressed, going to ' + target);
    location.href = target;
  }
}
addEventListener('DOMContentLoaded', (event) => {
  console.log('DOMContentLoaded');
  document.getElementById('filenamesearchform').addEventListener('submit', gofilesearch, false);
  document.getElementById('pinnamesearchform').addEventListener('submit', gopinsearch, false);
  Array.from(document.getElementsByClassName('signal')).forEach((signal) => {signal.addEventListener('mouseenter',entersignal, false)});
  Array.from(document.getElementsByClassName('signal')).forEach((signal) => {signal.addEventListener('mouseleave',leavesignal, false)});
  const svg = document.getElementById('svg');
  const svgContent = document.getElementById('svgContent');
  const bbox = svgContent.getBBox();
  console.log(svgContent);
  console.log(bbox);
  svg.setAttribute('viewBox', (Math.floor(bbox.x) - 10) + ' ' + (Math.floor(bbox.y) - 10) + ' ' + (Math.ceil(bbox.width) + 20) + ' ' + (Math.ceil(bbox.height) + 20));
  addEventListener('hashchange', hashchanged);
  hashchanged();
  document.addEventListener('keyup', keyuphandler);
});
" previous next)
                              ""))))))
      'replace)))

(define (render-all)
  (define dir "/home/nex/src/cadr/sys46/cadr/")
  (define outdir "/tmp/svg/")
  (set! all-defs (get (parse-suds-file "/home/nex/src/cadr/sys46/cadr/bodies.drw") 'body-def))
  (set! links '())
  (set! all-files (sort (lambda (a b) (string<? (car a) (car b)))
                        (map (lambda (fn) (cons (car fn) (parse-suds-file (cdr fn)))) (map (lambda (fn) (cons fn (string-append dir fn))) (filter (lambda (f) (string-suffix? ".drw" f)) (directory-list dir))))))
  ;; (for-each (lambda (file)
  ;;             (let ((page (substring (car file) 0 (- (string-length (car file)) 4))))
  ;;               (format #t "rendering ~a~%" (car file)) (flush-output-port)
  ;;               (drw->svg (cdr file) (string-append outdir (car file) ".svg") page)))
  ;;           all-files)
  (let ((first (car all-files))
        (last (car (last-pair all-files))))
    (define (getname file)
      (let* ((trailer (get (cdr file) 'trailer))
             (title (list-ref trailer 1))
             (subtitle (list-ref trailer 2)))
        (string-append title " – " subtitle)))
    ;; create all svg, collect all links
    (let ((svgs (map (lambda (file)
                       (let ((page (substring (car file) 0 (- (string-length (car file)) 4))))
                         (drw->svg (cdr file) #f page)))
                     all-files)))
      (for-each (lambda (file svg previous next)
                  (let* ((page (substring (car file) 0 (- (string-length (car file)) 4)))
                         (trailer (get (cdr file) 'trailer))
                         (title (list-ref trailer 1))
                         (subtitle (list-ref trailer 2)))
                    (drw->html (string-append outdir page ".html")
                               svg
                               page
                               (string-replace-string-all (car previous) ".drw" "")
                               (string-replace-string-all (car next) ".drw" "")
                               title
                               subtitle
                               all-files
                               links)))
                all-files
                svgs
                (cons last (take all-files (- (length all-files) 1)))
                (append (cdr all-files) (list first))))))
(define *tooltips* '(("DR" . "Dispatch R-bit is set. Ignore new PC, pop PC off the SPC stack.")
                     ("DN" . "Dispatch N-bit is set. Inhibit execution of next instruction.")
                     ("DP" . "Dispatch P-bit is set. Save return address to SPC, jump to new PC address.")
                     ("DESTIMOD0" . "Destination Instruction Modification (Low Part). OA-REG-LOW")
                     ("DESTIMOD1" . "Destination Instruction Modification (High Part). OA-REG-HI")
                     ("DFALL" . "Both P and R bit in dispatch instruction are set, fallthrough (do not dispatch)")
                     ("IRALU" . "Instruction Register contains an ALU instruction (IR44-IR43).")
                     ("IRBYTE" . "Instruction Register contains a BYTE instruction (IR44-IR43).")
                     ("IRJUMP" . "Instruction Register contains a JUMP instruction (IR44-IR43).")
                     ("IRDISP" . "Instruction Register contains a DISPATCH instruction (IR44-IR43).")
                     ("DEST" . "There is a Destination. True for ALU and BYTE instructions.")
                     ("DESTM" . "Destination M Memory. True for ALU or BYTE instructions that have IR25 set.")
                     ("DESTMEM" . "Destination (Main) Memory. The highest bit of the functional destination is set, destination is OA register, VMA or MD.")
                     ("SRCDC" . "Source Dispatch Constant")
                     ("ZERO16" . "Zero bits starting with 16 on MF bus. Set when source is DC, PDLPTR, PDLIDX or OPC.")
                     ("OPCINH" . "OPC Inhibit. Set by the spy interface, inhibits shifting the OPC values.")
                     ("IR1" . "Instruction Register bit 1: ALU: Q control. 0 Do nothing; 1 Shift Q left, shifting in the inverse of the sign of the ALU output (ALU31); 2 shift Q right, shifting in the low bit of the ALU output (ALU0); 3 Load Q from ALU output")
                     ("IR2" . "Instruction Register bit 2: ALU: Carry this bit into the low end of the ALU.")
                     ("IR5" . "Instruction Register bit 5: JUMP: If low, rotation count for M source. If high, condition number.")
                     ("IR6" . "Instruction Register bit 6: JUMP: Invert Condition")
                     ("IR7" . "Instruction Register bit 7: JUMP: N-Bit, NOP")
                     ("IR8" . "Instruction Register bit 8: JUMP: P-bit, Call")
                     ("IR9" . "Instruction Register bit 9: JUMP: R-bit, Return")
                     ("IR12" . "Output Bus Control. With IR13. 1 ALU; 2 ALU shifted right by one bit, with the correct sign shifted in; 3 ALU shifted left by one bit, shifting in Q31 from the right.")
                     ("IR13" . "Output Bus Control. With IR12. 1 ALU; 2 ALU shifted right by one bit, with the correct sign shifted in; 3 ALU shifted left by one bit, shifting in Q31 from the right.")
                     ("IR25" . "Instruction Register bit 25: DISPATCH: L-PC flag. Alter return address pushed on SPC by the CALL transfer type, if the N bit is set, to be the address of this instruction rather than the next instruction.")
                     ("IR42" . "Instruction Register bit 42: POPJ-bit, Return after next instruction.")
                     ("JRET" . "Jump Return. Set in a jump instruction with P set and R cleared.")
                     ("IWRITE" . "Instruction Write. Set in a jump instruction with P and R set.")
                     ("IWRITED" . "Instruction Write Delayed. Set in the clock cycle after a jump instruction with P and R set.")
                     ("IPOPJ" . "Instruction POPJ. POPJ bit is set and current instruction is not NOPed.")
                     ("IGNPOPJ" . "Ignore POPJ. Instruction is a DISPATCH instruction and R-bit is cleared.")
                     ("POPJ" . "POPJ. High if the POPJ bit in the current instruction is high and the current instruction is not NOPed or if a delayed instruction write (IWRITED) is active.")
                     ("JFALSE" . "Jump if False. Instruction is JUMP and condition is inverted.")
                     ("JCALF" . "Jump Call if False. Instruction is JUMP with P-bit set and condition inverted.")
                     ("JRETF" . "Jump Return if False. Instruction is JUMP with R-bit set and condition inverted.")
                     ("JCOND" . "Jump Condition. Selected based on IR0-IR2, IR5 must be high.")
                     ("FUNCT0" . "Miscellaneous Function bit 0. Decoded from IR10-IR11.")
                     ("FUNCT1" . "Miscellaneous Function bit 1. Decoded from IR10-IR11.")
                     ("FUNCT2" . "Miscellaneous Function bit 2. Decoded from IR10-IR11. DISPATCH: Write dispatch memory.")
                     ("FUNCT3" . "Miscellaneous Function bit 3. Decoded from IR10-IR11.")
                     ("DISPENB" . "Dispatch Enabled. Instruction is DISPATCH but not dispatch write.")
                     ("N" . "Next instruction will be NOPed.")
                     ("INOP" . "Instruction NOP. Previous instruction NOPed the current instruction.")
                     ("NOPA" . "NOP A. Previous instruction or Spy interface NOPed the current instruction.")
                     ("NOP" . "Previous instruction, Spy interface or a Trap NOPed the current instruction.")
                     ("PCS0" . "PC Source bit 0. False if popj, or dispatch and not fallthrough, or jump return if false and jump-condition is false, or jump return and jump condition and not jump invert condition. Used together with PCS1 to select the NPC bus source, 0=SPC, 1=IR, 2=DPC, 3=IPC.")
                     ("PCS1" . "PC Source bit 1. False if popj and not ignore popj, or jump if false and not jump condition, or instruction is jump and not invert condition and jump condition, or dispatch enabled and R-bit but not P-bit. Used together with PCS0 to select the NPC bus source, 0=SPC, 1=IR, 2=DPC, 3=IPC.")
                     ("IPC*" . "Incremented PC")
                     ("NPC*" . "Next PC")
                     ("SPCPTR*" . "SPC Pointer")
                     ("SPCW*" . "SPC Write. The PC value that is written to the SPC stack.")
                     ("SPCO*" . "Stack PC Out")
                     ("SPC*" . "Stack PC")
                     ("DPC*" . "Dispatch PC")
                     ("LPC*" . "Last PC")
                     ("WPC*" . "Write PC. The PC that could be written to the SPC stack.")
                     ("RETA*" . "Return Address. The PC value of either the next or the current instruction that could be written to the SPC stack.")
                     ("DESTSPCD" . "Destination SPC delayed. Set in the clock cycle after DESTSPC was set.")
                     ("PCC*" . "Alias of PC")
                     ("PCB*" . "Alias of PC")
                     ("ICE*" . "Instruction (Memory) Chip Enable.")
                     ("IOB*" . "Instruction (Modify) OR Bus. OR of instruction from I-MEM and Output Bus.")
                     ("DESTIMOD0" . "Destination Instruction Modified 0. Modify the low part of the next instruction.")
                     ("DESTIMOD1" . "Destination Instruction Modified 1. Modify the high part of the next instruction.")
                     ("IMOD" . "Instruction Modified.")
                     ("TRAPA" . "Alias of TRAP")
                     ("TRAPB" . "Alias of TRAP")
                     ("TRAP" . "Set on Parity Error if Traps are enabled via Spy or on Boot Trap.")
                     ("CLK0" . "Main clock signal.")
                     ("CLK1" . "Alias of CLK0")
                     ("CLK2" . "Alias of CLK0")
                     ("CLK3" . "Alias of CLK0")
                     ("CLK4" . "Alias of CLK0")
                     ("CLK5" . "Alias of CLK0")
                     ("TPWP" . "TP? Write Pulse")
                     ("TPWPIRAM" . "TP? Write Pulse Instruction RAM")
                     ("TPTSE" . "TP? Tristate Enable")
                     ("TSE*" . "Tristate Enable. Alias of TPTSE.")
                     ("WP1" . "Write Pulse. Alias of TPWP.")
                     ("WP2" . "Write Pulse. Alias of TPWP.")
                     ("WP3" . "Write Pulse. Alias of TPWP.")
                     ("WP4" . "Write Pulse. Alias of TPWP.")
                     ("WP5" . "Write Pulse. Alias of TPWPIRAM.")
                     ("SPUSH" . "Stack (PC) Push. High if destination is SPC, if jump call if false and condition is false, if dispatch enabled and P but not R, or if jump and not invert condition and P and condition is true.")
                     ))
(define (test)
  (define init.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/init.drw"))
  (define init.drw.words (unpack init.drw))
  (define amem0.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/amem0.drw"))
  (define amem0.drw.words (unpack amem0.drw))
  (define amem1.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/amem1.drw"))
  (define amem1.drw.words (unpack amem1.drw))
  (define dram1.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/dram1.drw"))
  (define dram1.drw.words (unpack dram1.drw))

  (define all-defs (get (parse-suds-file "/home/nex/src/cadr/sys46/cadr/bodies.drw") 'body-def))
  ;; (define ndips (unpack (read-binary-file "/home/nex/tmp/its/bin/datdrw/ndips.dip")))

  (for-each (lambda (f) (guard (e (else (format #t "failed: ~s~%" f)
                                   (display-condition e)
                                   (newline)))
                     (if (string-suffix? ".drw" f) (parse-suds-file (string-append "/home/nex/src/cadr/sys46/cadr/" f)))))
            (directory-list "/home/nex/src/cadr/sys46/cadr/"))
  (drw->svg "/home/nex/src/cadr/sys46/cadr/contrl.drw" "/tmp/contrl.svg" "contrl")
  (drw->svg "/home/nex/scheme/chez/suds-drw/advent.drw" "/tmp/advent.svg" "advent")
  (drw->svg "/home/nex/src/cadr/sys46/lmdoc/chod1.drw" "/tmp/chod1.svg" "chod1"))
;;(test)
#!eof
(define init.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/init.drw"))
(define init.drw.words (unpack init.drw))
(define amem0.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/amem0.drw"))
(define amem0.drw.words (unpack amem0.drw))
(define amem1.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/amem1.drw"))
(define amem1.drw.words (unpack amem1.drw))
(define dram1.drw (read-binary-file "/home/nex/src/cadr/sys46/cadr/dram1.drw"))
(define dram1.drw.words (unpack dram1.drw))

(for-each (lambda (f) (guard (e (else (format #t "failed: ~s~%" f) (display-condition e)(newline)))
                   (if (string-suffix? ".drw" f) (parse-suds-file (string-append "/home/nex/src/cadr/sys46/cadr/" f)))))
          (directory-list "/home/nex/src/cadr/sys46/cadr/"))

(define all-defs (get (parse-suds-file "/home/nex/src/cadr/sys46/cadr/bodies.drw") 'body-def))
(drw->svg "/home/nex/src/cadr/sys46/cadr/contrl.drw" "/tmp/contrl.svg")

(print-raw "/home/nex/scheme/chez/suds-drw/sys46-chod1.drw")

(define ndips (unpack (read-binary-file "/home/nex/tmp/its/bin/datdrw/ndips.dip")))
(drw->svg "/tmp/cadr/advent.drw" "/tmp/advent.svg" "advent")
(drw->svg "/tmp/cadr/chod1.drw" "/tmp/chod1.svg" "chod1")
