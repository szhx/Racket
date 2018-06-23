;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l11q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (change-char char)
  (cond
    [(char-upper-case? char) (char-downcase char)]
    [(char-lower-case? char) (char-upcase char)]
    [else char]))
 
(define (switch-case str)
  (list->string (map change-char (string->list str))))
                     