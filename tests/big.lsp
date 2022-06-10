(import "test")


($test (+ 1111111111111111111111111111111  12) 1111111111111111111111111111123)
($test (+ -81272333331928888888888888888888 -9287319287981237469182378) -81272342619248176870126358071266)
($test (* 1111111111111111111111111111111  12) 13333333333333333333333333333332)
($test (* 12312831928739187223123827 9183209812302983091829382) 113071318985235168783240693245801852357698142884914)
($test (* 2888888888888888888888888888888888 9999999999999999999999999999999) 28888888888888888888888888888885991111111111111111111111111111112)
($test (* 11111111111111111111111111111111111111 2) 22222222222222222222222222222222222222)
($test (- 1111111111111111111111111111111111111111111111111111 111111111111111111111111111111111111113) 1111111111110999999999999999999999999999999999999998)
($test (+ -283172983728888888888128712999999999 387192888888888888888888888888) -283172596535999999999239824111111111)
($test (+ 283742983749283742934792373477 -12877192837298723128888888) 283730106556446444211663484589)
($test (- 11111111111111111111111111111 11111111111111111111111111111) 0)
($test (- 11111111111111111111111111111 11111111111111111111111111110) 1)

($test (div 11111111111111111111111111111111111111111111 11111111111111111111111111111111111111111111) 1)
($test (div 11111111111111111111111111111111111111111111 1111111111111111111111111111111111111111111) 10)
($test (div 11111111111111111111111111111111111111111111 1) 11111111111111111111111111111111111111111111)
($test (div 100000000000000000000000000000000000000000000000 100000000000000000000000000) 1000000000000000000000)
($test (div 1000000000000002000000000000000 1000001000000000) 999999000001001)
($test (* 100000000000000000000000000 1000000000000000000000) 100000000000000000000000000000000000000000000000)

;($test (convert 2837912874982137192837192837287312947728 <float>) 2.83791e+39 =)

($test (= (ntt* (expt 8 5999) (expt 9 5999)) (* (expt 8 5999) (expt 9 5999))) t)
($test (= (ntt* (expt 2 5999) (expt 3 5999)) (* (expt 3 5999) (expt 2 5999))) t)
($test (= (ntt* (expt 2 599) (expt 3 5999)) (* (expt 3 5999) (expt 2 599))) t)
($test (= (ntt* (expt 2 59) (expt 3 5999)) (* (expt 3 5999) (expt 2 59))) t)
($test (= (ntt* (expt 3 10999) (expt 2 10999)) (* (expt 3 10999) (expt 2 10999))) t)
($test (= (ntt* (expt 3 10999) (expt 3 10929)) (* (expt 3 10999) (expt 3 10929))) t)

(defglobal a (expt 8 5999))
(defglobal b (expt 9 5999))

(defun bigtest1 (n)
    (if (= n 0)
        t
        (progn (ntt* a b) (bigtest1 (- n 1)))))

(defun bigtest2 (n)
    (if (= n 0)
        t
        (progn (* a b) (bigtest2 (- n 1)))))




