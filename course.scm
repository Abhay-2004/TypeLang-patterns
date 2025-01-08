(define courseAndEnrollment : List<(num, bool)>
    (list : (num, bool)
        (cons 3420 #t)
        (cons 3090 #f)
        (cons 3310 #f)))

(define getTitle : (List<(num, bool)> -> List<num>)
    (lambda (lst : List<(num, bool)>)
        (if (null? lst)
            (list : num)
            (cons (car (car lst))
                 (getTitle (cdr lst))))))

(define procStudent : (List<(num, bool)> (List<(num, bool)> -> List<num>) -> List<num>)
    (lambda (data : List<(num, bool)>
             proc : (List<(num, bool)> -> List<num>))
        (proc data)))