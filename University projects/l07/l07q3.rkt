;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l07q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct card (value suit))

(define (values asuit cardlist)
  (cond
    [(empty? cardlist) empty] 
    [(equal? asuit (card-suit (first cardlist)))
     (cons (card-value (first cardlist)) (values asuit (rest cardlist)))]
    [else (values asuit (rest cardlist))]))