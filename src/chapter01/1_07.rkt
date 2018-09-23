#lang racket/base

(require rackunit)


(define (square x) (* x x))


(define (average x y)
    (/ (+ x y) 2))


(define (improve guess x)
    (average guess (/ x guess)))


(define (good-enough? guess prev-guess)
    (< (abs (- guess prev-guess)) 0.00000001))


(define (sqrt-iter guess prev-guess x)
    (if (good-enough? guess prev-guess)
        guess
        (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
    (sqrt-iter 1.0 0 x))


;;; UNITTEST
(check-equal? (sqrt 4) 2.0)
(check-equal? (sqrt 625) 25.0)
(check-not-equal? (sqrt 6) 3)
(check-not-equal? (sqrt 9) 4)

