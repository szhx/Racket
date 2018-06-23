;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 02, Problem 1
;;***************************************************
;;

;; The constants are the days in 1 month (m)
;;   and days in 1 year (y)
(define m 30)
(define y 360)

;; (days-on-earth byear bmonth bday cyear cmonth cday)
;;   produces how many days did the person
;;   live on earth from his/her birthday to
;;   the current date
;; days-on-earth: Nat Nat -> Nat
;; Examples:
(check-expect (days-on-earth 1999 1 1 1999 2 1) 30)

(define (days-on-earth byear bmonth bday
                       cyear cmonth cday)
  (+ (* y (- cyear byear))
     (* m (- cmonth bmonth))
     (- cday bday)))

;; Tests:
(check-expect (days-on-earth 0 1 1 1 1 1) 360)
(check-expect (days-on-earth 0 1 1 0 2 1) 30)
(check-expect (days-on-earth 0 1 1 0 1 5) 4)


