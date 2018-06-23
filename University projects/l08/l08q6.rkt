;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l08q6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (make-sqr-al n b)
  (cond
    [(= (- b n) 0) (cons (list b (sqr b)) empty)]
    [else (cons (list n (sqr n))
                (make-sqr-al (add1 n) b))]))