#lang racket/base

(require rackunit)

(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))


(define (iter-expt b n)
    (define (iter b n res)
        (if (= n 0)
            res
            (iter b (- n 1) (* res b))))

    (iter b n 1)
)


(define (even? n)
    (= (remainder n 2) 0))

(define (square x)
    (* x x))

(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))


(define (iter-fast-expt b n)
    (define (iter b n res)
        (cond ((= n 0) res)
              ((even? n) (iter (square b) (/ n 2) res))
              (else (iter b (- n 1) (* res b)))))
    (iter b n 1)
)

;;;UNITTESTS
(check-equal? (expt 2 3) 8)
(check-equal? (expt 4 4) 256)
(check-equal? (iter-expt 2 3) 8)
(check-equal? (iter-expt 4 4) 256)
(check-equal? (fast-expt 2 3) 8)
(check-equal? (fast-expt 4 4) 256)
(check-equal? (iter-fast-expt 2 3) 8)
(check-equal? (iter-fast-expt 4 4) 256)