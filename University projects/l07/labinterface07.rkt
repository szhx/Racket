;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname labinterface07) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct event (type dur))
;; An Event is a (make-event Sym Int), where 
;;      type is the type of the event, and
;;      dur is the duration of the event and is a positive integer in minutes.

(define-struct card (value suit))
;; A Card is a (make-card Nat Sym), where
;;      value is the card value in the range 1 - 10 and
;;      suit is the card suit in the set 'hearts, 'diamonds, 'spades, and 'clubs.

(define-struct clock (hours mins))
;; A Clock is a (make-clock Nat Nat), where
;;      hours is the number of hours in the range 0 - 23 and
;;      mins is the number of minutes in the range 0 - 59.


;; Lab 07, Question 1

(define (total-dur eventlist)
  ...)

;; Lab 07, Question 2

(define (max-card loc)
  ...)

;; Lab 07, Question 3

(define (values asuit cardlist)
  ...)

;; Lab 07, Question 4

(define (update-times clist m)
  ...)

;; Lab 07, Question 5

(define (average-length alist t)
  ...)
