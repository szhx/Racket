;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (get-length a)
 (build-list (string-length a) add1))

(define (prefix s n)
  (cond
    [(empty? n) empty]
    [else (cons (substring s 0 (first n))
                (prefix s (rest n)))]))

(define (prefixes s)
  (prefix s (get-length s)))
       

  