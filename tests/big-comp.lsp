;;new bignum compiler test

(defglobal a 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111)
(defglobal b 222222222222222222222222222222222222222222222222222222222222222222222222222222222222222)
(defglobal c (* a b))

(defun foo (x)
    (let ((y 222222222222222222222222222222222222222222222222222222222222222222222222222222222222))
        (lambda (z) (+ x y z))))