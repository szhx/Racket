;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 03, Problem 1
;;***************************************************
;;

;; (is-leap-year?) produces the year that can be
;;   divided by either 4 or 400 and with these 2
;;   conditions it will produce true,
;;   but it will produce false if the year can be
;;   divided by 100 or in any other situations.
;; is-leap-year?: Bool Nat -> Bool

;; Examples:
(check-expect (is-leap-year? 2017) false)
(check-expect (is-leap-year? 2016) true)

(define (is-leap-year? yr)
  (cond
    [(= (remainder yr 400) 0) true]
    [(= (remainder yr 100) 0) false]
    [else
     (cond
       [(= (remainder yr 4) 0) true]
       [else false])]))

;; Tests:
(check-expect (is-leap-year? 2400) true)
(check-expect (is-leap-year? 2444) true)
(check-expect (is-leap-year? 2200) false)
(check-expect (is-leap-year? 2443) false)
