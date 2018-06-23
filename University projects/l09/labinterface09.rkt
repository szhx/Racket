;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname labinterface09) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct event (type dur))
;; An Event is a (make-event Sym Nat), where 
;;      type is the type of the event, and
;;      dur is the duration of the event in minutes (dur > 0).


;; Lab 09, Question 2

(define (create-events typelist durlist)
  ...)

;; Lab 09, Question 3

(define (extract-bad bad-part whole-string)
  ...)

;; Lab 09, Question 4

(define (subseq-string pattern target)
  ...)

