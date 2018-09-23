#lang racket/base

(require rackunit)

(define (square x) (* x x))

(define (sum-of-square a b) (+ (square a) (square b)))

(define (sum-of-square-max-two a b c)
    (cond ((and (>= a c) (>= b c)) (sum-of-square a b))
          ((and (>= a b) (>= c b)) (sum-of-square a c))
          ((and (>= b a) (>= c a)) (sum-of-square b c))))


;;; UNITTEST
(check-equal? (square 5) 25)
(check-not-equal? (square 6) 26)
(check-equal? (sum-of-square 3 4) 25)
(check-not-equal? (sum-of-square 3 3) 20)
(check-equal? (sum-of-square-max-two 3 4 2) 25)
(check-equal? (sum-of-square-max-two 3 4 5) 41)
(check-equal? (sum-of-square-max-two 5 4 6) 61)