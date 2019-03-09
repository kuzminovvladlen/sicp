#lang racket/base

(require rackunit)

(define (pascal-triangle-element n p)
    (cond ((= p 0) 1)
          ((= p n) 1)
          (else 
            (+ (pascal-triangle-element (- n 1) (- p 1)) (pascal-triangle-element (- n 1) p)))))

;;;UNITTESTS

(check-equal? (pascal-triangle-element 0 0) 1)
(check-equal? (pascal-triangle-element 1 0) 1)
(check-equal? (pascal-triangle-element 1 1) 1)
(check-equal? (pascal-triangle-element 2 0) 1)
(check-equal? (pascal-triangle-element 2 1) 2)
(check-equal? (pascal-triangle-element 2 2) 1)
(check-equal? (pascal-triangle-element 4 2) 6)