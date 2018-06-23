;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l09q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (extract-bad bad-part whole-string)
  (list->string
   (extract (string->list bad-part)
            (string->list whole-string))))

(define (extract bad whole)
  (cond
    [(empty? whole) empty]
    [(empty? bad) whole]
    [(equal? (first bad) (first whole))
     (extract (rest bad) (rest whole))]
    [else (cons (first whole)
                (extract bad (rest whole)))]))