;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l09q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct event (type duration))

(define (create-events typelist durlist)
  (cond
    [(and (empty? typelist) (empty? durlist)) empty]
    [else (cons (make-event (first typelist)
                            (first durlist))
                (create-events (rest typelist)
                              (rest durlist)))]))
     