;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 03, Problem 3
;;***************************************************
;;

;; (new-years-holiday) produces which day in the week that
;;   New Year's Day Statuory Holiday will be taking place
;;   and if that day lies in the weekend, then it will automatically 
;;   change to monday in the next week
;; new-years-holiday: Nat -> Str

;; The following constants specify the expected format
;;   for the days of the week
(define sunday "Sunday")
(define monday "Monday")
(define tuesday "Tuesday")
(define wednesday "Wednesday")
(define thursday "Thursday")
(define friday "Friday")
(define saturday "Saturday")

;; Examples:
(check-expect (new-years-holiday 2017) "Monday")
(check-expect (new-years-holiday 2018) "Monday")

(define (new-years-holiday year)
  (cond
    [(equal? (gauss year) 0) monday]
    [(equal? (gauss year) 1) monday]
    [(equal? (gauss year) 2) tuesday]
    [(equal? (gauss year) 3) wednesday]
    [(equal? (gauss year) 4) thursday]
    [(equal? (gauss year) 5) friday]
    [(equal? (gauss year) 6) monday]))

;; (gauss) produces a number of the day in a week such that 0
;;   is Sunday, 1 is Monday, through to 6 is Saturday
;; gauss: Nat -> Nat

;;Examples:
(check-expect (gauss 2016) 5)
(check-expect (gauss 2015) 4)

(define (gauss A)
  (remainder
   (+ 1 (* 5 (remainder (- A 1) 4))
      (* 4 (remainder (- A 1) 100))
      (* 6 (remainder (- A 1) 400))) 7))

;;Tests:
(check-expect (new-years-holiday 2014) "Wednesday")
(check-expect (new-years-holiday 2011) "Monday")
(check-expect (new-years-holiday 2016) "Friday")
(check-expect (new-years-holiday 2015) "Thursday")
(check-expect (new-years-holiday 2013) "Tuesday")
