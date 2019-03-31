;part 1
(define (gen-list start end)
    (if (> start end) #f)
    (if (<= start end) (cons start (gen-list (+ 1 start) end))) )
;----------------------------------
;part 2
(define (pair-sum-util list fnum numb)
  (if (null? list) #f
  (if (= (+ (car list) fnum) numb ) #t #f)))

(define (pair-sum list numb)
  (if (null? list) #f
  (or (pair-sum-util (cdr list) (car list) numb) (pair-sum (cdr list) numb) )))
;----------------------------------

(define gen-lazy-list
  (lambda (start stop)
    (if (> start stop)
        #f
        (cons start
            (lambda () (gen-lazy-list (+ start 1) stop))))))
;----------------------------------
;part 3
(define (pair-lazy-sum list num)
  (if (null? list) #f
    (if (pair-sum-util (cdr list) (car list) num ) #t
      (pair-lazy-sum (cdr list) num))))

;function defines two arguments, the call to helper function pair-sum-util checks for the first two numbers currently at start of list, if helper returns true function returns #t from here. Otherwise recursive call is made.