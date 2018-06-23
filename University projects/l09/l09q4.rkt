;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l09q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (subseq-string pattern target)
  (list->string
   (change (string->list pattern)
            (string->list target))))

(define (change a b)
  (cond
    [(empty? b) empty]
    [(empty? a) b]
    [(equal? (first a) (first b))
     (cons (char-upcase (first b))
           (change (rest a) (rest b)))]
    [else (cons (first b)
                (change a (rest b)))]))