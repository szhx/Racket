;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l08q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (largest-prime bottom top)
  (cond
    [(and (= top bottom) (prime? bottom)) bottom]
    [(and (= top bottom) (not (prime? bottom))) false]
    [(prime? top) top]
    [else (largest-prime bottom (sub1 top))])) 

(define (prime? a)
  (cond
    [(= a 1) false]
    [(= a 2) true]
    [else (not (div a 2 (ceiling (sqrt a))))]))

(define (div a b c)
  (cond
    [(= b c) (mult a b)]
    [(mult a b) true]
    [else (div a (add1 b) c)]))

(define (mult a b)
  (equal? (remainder a b) 0))

