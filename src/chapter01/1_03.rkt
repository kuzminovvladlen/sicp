#lang racket
(define (square x) (* x x))

(define (sum-of-square a b) (+ (square a) (square b)))

(define (sum-of-square-max-two a b c)
    (cond ((and (>= a c) (>= b c)) (sum-of-square a b))
          ((and (>= a b) (>= c b)) (sum-of-square a c))
          ((and (>= b a) (>= c a)) (sum-of-square b c))))