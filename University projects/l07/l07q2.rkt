;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l07q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct card (value suit))

(define (max-card loc)
  (cond
    [(empty? (rest loc)) (first loc)]
    [(> (card-value (first loc))
        (card-value (first (rest loc))))
     (max-card (cons (first loc) (rest (rest loc))))]
    [else (max-card (rest loc))]))