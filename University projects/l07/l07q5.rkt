;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l07q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct event (type dur))
;; An Event is a (make-event Sym Int), where 
;;      type is the type of the event, and
;;      dur is the duration of the event and is a positive integer in minutes.

(define (average-length alist t)
  (cond
    [(empty? alist) 0]
    [else (/ (dur alist t)
             (max (num alist t) 1))]))

(define (dur alst x)
  (cond
    [(empty? alst) 0]
    [(equal? (event-type (first alst)) x)
     (+ (event-dur (first alst))
             (dur (rest alst) x))]
    [else (dur (rest alst) x)]))

(define (num als y)
  (cond
    [(empty? als) 0]
    [(equal? (event-type (first als)) y)
     (+ 1 (num (rest als) y))]
    [else (num (rest als) y)]))
    

