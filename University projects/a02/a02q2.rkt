;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 02, Problem 2
;;***************************************************
;;

;; (exact-cost) produces the cost to purchase
;;   an exact number of Timbits which each costs
;;   $0.25, 20 costs $3 and 60 costs $8
;; exact-cost: Num -> Num
;; Example:
(check-expect (exact-cost 170) 24.5)

(define (exact-cost class-size)
  (+ (* (quotient class-size 60) 8)
     (* (quotient (- class-size
                     (* (quotient class-size 60) 60))
                  20) 3)
     (* (- class-size
           (* (quotient class-size 60) 60)
           (* (quotient (- class-size
                     (* (quotient class-size 60) 60))
                  20) 20))
        0.25)))

;; Tests:
(check-expect (exact-cost 15) 3.75)
(check-expect (exact-cost 33) 6.25)
(check-expect (exact-cost 180) 24)
           
           