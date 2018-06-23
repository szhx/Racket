;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 05, Problem 1
;;***************************************************
;;

;; (all-multiple? alon) produces a boolean value
;;   that is true if every number in the list is a multiple
;;   of the previous value and true is there is only one
;;   element in the list and false otherwise.
;; all-multiple?: (listof Nat) -> Bool
;; Requires: all the Natural number in the list should not be zero.
;; Examples:
(check-expect (all-multiple? (cons 7 empty)) true)
(check-expect (all-multiple?  (cons 1 (cons 2 (cons 6 (cons 36 (cons 36 (cons 72 empty))))))) true) 
  
(define (all-multiple? alon)
  (cond
    [(empty? (rest alon)) true]
    [(and (= (remainder (first (rest alon)) (first alon)) 0)
          (all-multiple? (rest alon))) true]
    [else false]))

;; Tests:
(check-expect (all-multiple?  (cons 1 (cons 2 (cons 6 (cons 36 (cons 36 (cons 48 empty))))))) false)
(check-expect (all-multiple?  (cons 1 (cons 2 (cons 6 (cons 3 (cons 36 (cons 48 empty))))))) false)
(check-expect (all-multiple?  (cons 4 (cons 7 (cons 23 (cons 37 (cons 47 (cons 53 empty))))))) false)
(check-expect (all-multiple?  (cons 1 (cons 2 (cons 6 (cons 36 (cons 36 empty)))))) true)
(check-expect (all-multiple?  (cons 36 (cons 2 (cons 6 (cons 36 (cons 36 empty)))))) false)
(check-expect (all-multiple?  (cons 4 (cons 4 (cons 4 (cons 4 (cons 4 empty)))))) true)
(check-expect (all-multiple?  (cons 1 (cons 2 (cons 6 (cons 36 (cons 144 empty)))))) true)







    