(define dummyStrategy : (num num -> bool)
    (lambda (x : num y : num) #f))

(define strategy : Ref (num -> (num num -> bool))
    (ref : (num -> (num num -> bool))
        (lambda (n : num) dummyStrategy)))

(define getStrategy : (num -> (num num -> bool))
    (lambda (n : num)
        ((deref strategy) n)))

(define setStrategy : (num (num num -> bool) -> bool)
    (lambda (n : num fn : (num num -> bool))
        (let ((oldStrategy : (num -> (num num -> bool)) (deref strategy)))
            (let ((temp : (num -> (num num -> bool))
                    (set! strategy
                        (lambda (k : num)
                            (if (= k n)
                                fn
                                (oldStrategy k))))))
                #t))))

(define applyStrategy : (num num num -> bool)
    (lambda (n : num x : num y : num)
        ((getStrategy n) x y)))