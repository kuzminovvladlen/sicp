#lang racket/base

(require rackunit)

(define (f-rec n)
    (if (< n 3)
        n
        (+ (f-rec (- n 1)) (f-rec (- n 2)) (f-rec (- n 3)))))


(define (f-iter n)
    (define (iter n a b c)
        (if (= n 0)
            c
            (iter (- n 1) (+ a b c) a b)))

    (iter n 2 1 0))

;;;UNITTEST
(check-equal? (f-rec 1) 1)
(check-equal? (f-rec 2) 2)
(check-equal? (f-rec 3) 3)
(check-equal? (f-rec 4) 6)
(check-equal? (f-rec 5) 11)
(check-equal? (f-rec 6) 20)

(check-equal? (f-iter 1) 1)
(check-equal? (f-iter 2) 2)
(check-equal? (f-iter 3) 3)
(check-equal? (f-iter 4) 6)
(check-equal? (f-iter 5) 11)
(check-equal? (f-iter 6) 20)
