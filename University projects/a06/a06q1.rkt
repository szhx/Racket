;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 06, Problem 1
;;***************************************************
;;

;; (countdown n2 current2) produces a list of n2 number of
;;   descending odd integers that are larger than or equal
;;   to current2
;; countdown: Nat Int -> (listof Int)
;; Example:
(check-expect (countdown 2 5) (list 7 5))

(define (countdown n2 current2)
  (cond
    [(= n2 0) empty]
    [(even? current2)
     (cons (+ current2 1 (* (- n2 1) 2))
           (countdown (sub1 n2) current2))]
    [else (cons (+ current2 (* (- n2 1) 2))
                (countdown (sub1 n2) current2))]))

;; (countup n1 current1 a b) produces a list of n1 number of even
;;   integers and a number of odd integers, and all of the even
;;   integers are larger than or equal to the current1 integer, and all of the
;;   odd intergers are larger than or equal to b. The order of 
;;   the integers is that even integers are ascending and
;;   odd integers are descending after all the even integers.
;; countup: Nat Int Nat Int -> (listof Int)
;; Example:
(check-expect (countup 2 5 2 5) (list 6 8 7 5))

(define (countup n1 current1 a b)
  (cond
    [(= n1 0) (countdown a b)]
    [(even? current1)
     (cons current1 (countup
                     (sub1 n1) (+ 2 current1) a b))]
    [else
     (cons (+ current1 1)
           (countup (sub1 n1)
                    (+ 2 current1) a b))]))

;; (even-up-odd-down n current) is the wrapper funtion
;;   for countup, which produces a list of n number ascending even
;;   integers and n number of descending odd integers
;;   that are larger than or equal to current
;; even-up-odd-down: Nat Int -> (listof Int)
;; Example:
(check-expect (even-up-odd-down 2 5) (list 6 8 7 5))

(define (even-up-odd-down n current)
  (countup n current n current))

;; Tests:
(check-expect (even-up-odd-down 3 4) (list 4 6 8 9 7 5))
(check-expect (even-up-odd-down 0 4) empty)
(check-expect (even-up-odd-down 3 5) (list 6 8 10 9 7 5))
(check-expect (even-up-odd-down 2 -5) (list -4 -2 -3 -5))
(check-expect (even-up-odd-down 3 -3) (list -2 0 2 1 -1 -3))

