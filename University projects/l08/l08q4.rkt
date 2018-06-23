;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l08q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (exponent-without-mult x n)
  (cond
    [(= n 0) 1]
    [else (mult x (exponent-without-mult x (sub1 n)))]))

(define (mult a b)
  (cond
    [(= b 0) 0]
    [else (+ a (mult a (sub1 b)))]))
