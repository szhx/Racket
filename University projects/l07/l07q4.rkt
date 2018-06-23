;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l07q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct clock (hours mins))
;; A Clock is a (make-clock Nat Nat), where
;;      hours is the number of hours in the range 0 - 23 and
;;      mins is the number of minutes in the range 0 - 59.

(define (update-times clist m)
  (cond
    [(empty? clist) empty]
    [else (cons (make-clock
                 (+ (quotient m 60) (clock-hours (first clist))
                    (quotient (+ (remainder m 60) (clock-mins (first clist))) 60))
                 (remainder (+ (remainder m 60) (clock-mins (first clist))) 60))
                (update-times (rest clist) m))]))
                
                 
                 