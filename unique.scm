(define member : (num List<num> -> bool)
  (lambda (x : num lst : List<num>)
    (if (null? lst)
        #f
        (if (= x (car lst))
            #t
            (member x (cdr lst))))))

(define remove_earlier : (num List<num> -> List<num>)
  (lambda (x : num lst : List<num>)
    (if (null? lst)
        (list : num)
        (if (= x (car lst))
            (remove_earlier x (cdr lst))
            (cons (car lst) (remove_earlier x (cdr lst)))))))

(define process : (List<num> List<num> -> List<num>)
  (lambda (lst : List<num> seen : List<num>)
    (if (null? lst)
        (list : num)
        (let ((x : num (car lst))
              (rest : List<num> (cdr lst)))
          (if (member x rest)
              (process rest seen)
              (cons x (process rest (cons x seen))))))))

(define unique : (List<num> -> List<num>)
  (lambda (lst : List<num>)
    (process lst (list : num))))