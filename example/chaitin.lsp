#|
limits of mathematics G.J.chaitin
H(x,y) <= H(x)+H(y)+c
in H(x) x means sexp.
H(x) means bit size of minimum UTM that calculate x.
H(y) means bit size of minimum UTM that calculate y.

φc x* y* 
x* means minimum size program of x
y* means minimum size program of y
φc is prefix for constant c

(cons (eval (read-exp)) (cons (eval (read-exp)) nil) -> it make pair of x and y.
|#          

(import "test")

;;; UTM universal turing machine 
(defun U (p)
    (try 'no-time-limit
         '(eval (read-exp))
         p))

;;; make binary list of s-expression
;;; add newline to sexp 
(defun bits (s)
    (let ((stream (create-string-output-stream))
          (str nil))
        (format stream "~A~%" s)
        (setq str (get-output-stream-string stream))
        (for ((i 0 (+ i 1))
              (limit (length str))
              (bin nil (append bin (char-to-bin (elt str i)))))
             ((>= i limit) bin))))

;;; make list of binary. ascii code.
(defun int-to-bin (n m) 
    (reverse (int-to-bin1 n m)))

(defun int-to-bin1 (n m)
    (cond ((= m 0) nil) 
          ((< n 2) (cons n (int-to-bin1 0 (- m 1))))
          (t (cons (mod n 2) (int-to-bin1 (div n 2) (- m 1))))))

;;; make binary list of charactor c
(defun char-to-bin (c)
    (int-to-bin (convert c <integer>) 8))


;;; size of s-exp in binary
(defun size (s)
   (length (bits s)))

;;; loop function
;;; eval can't calculate foo function.
(defun foo ()
    (foo))

#|
Now count-halt does not work.
|#
(defun count-halt (time prefix bit-left)
    (if (= bit-left 0)
        (check prefix)
        (+ (count-halt time (cons 0 prefix) (- bit-left 1))
           (count-halt time (cons 1 prefix) (- bit-left 1)))))

(defun check (prefix)
    ;(print prefix)
    (if (eq 'success (car (try 100 '(eval (read-exp)) prefix)))
        1 
        0))

;;; test
($test (size '(+ 1 2)) 64)
($test (size '(cons (eval (read-exp)) (cons (eval (read-exp)) nil))) 432)
($test (bits '(+ 1 2))
    (0 0 1 0 1 0 0 0 0 0 1 0 1 0 1 1 0 0 1 0 0 0 0 0 0 0 1 1 0 0 0 1 0 0 1 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 1 0 1 0 0 1 0 0 0 0 1 0 1 0))
($test (u (bits '(+ 1 2))) 3)
($test (u (bits '(+ g 2))) failse)
($test (elt (try 100 '(eval (read-exp)) (bits '(foo))) 1) out-of-time)
($test (car (try 100 '(eval (read-exp)) (bits '(+ 1 2)))) success)
($test (elt (try 100 '(eval (read-exp)) (bits '(+ h 2))) 1) out-of-data)