#lang racket/base

(require rackunit)

(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

;;; UNITTEST

(check-equal? (A 1 10) 1024)
(check-equal? (A 2 4) 65536)
(check-equal? (A 3 3) 65536)

(check-equal? (f 1) 2)  
(check-equal? (f 2) 4)
(check-equal? (f 3) 6)
(check-equal? (f 4) 8)
(check-equal? (f 5) 10) ;;; -> 2 * n

(check-equal? (g 1) 2)  
(check-equal? (g 2) 4)
(check-equal? (g 3) 8)
(check-equal? (g 4) 16)
(check-equal? (g 5) 32) ;;; -> 2 ^ n

(check-equal? (h 1) 2)
(check-equal? (h 2) 4)
(check-equal? (h 3) 16)
(check-equal? (h 4) 65536) ;;; -> 2^h(n-1)