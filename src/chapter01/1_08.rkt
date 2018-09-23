#lang racket/base

(require rackunit)


(define (square x) (* x x))


(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))


(define (good-enough? guess prev-guess)
    (< (abs (- guess prev-guess)) 0.00000001))


(define (cube-sqrt-iter guess prev-guess x)
    (if (good-enough? guess prev-guess)
        guess
        (cube-sqrt-iter (improve guess x) guess x)))

(define (cube-sqrt x)
    (cube-sqrt-iter 1.0 0 x))


;;; UNITTEST
(check-equal? (cube-sqrt 8) 2.0)
(check-equal? (cube-sqrt 27) 3.0)
(check-equal? (cube-sqrt 125) 5.0)
(check-not-equal? (cube-sqrt 81) 9.0)
(check-not-equal? (cube-sqrt 64) 8.0)

