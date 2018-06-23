;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 03, Problem 2
;;***************************************************
;;

;; (day-of-year) produces the exact day of the year
;;   by using a string of that date, and it also includes
;;   the consideration about the leap-year
;; day-of-year: Str -> Nat
;; requires: string parameter (date) must be in the format
;;   MMM dd YYYY, and the month must be written in capital
;;   letter

;; The following constants specify the expected format for the months.
(define january "JAN")
(define february "FEB")
(define march "MAR")
(define april "APR")
(define may "MAY")
(define june "JUN")
(define july "JUL")
(define august "AUG")
(define september "SEP")
(define october "OCT")
(define november "NOV")
(define december "DEC")

;; Examples:
(check-expect (day-of-year "DEC 25 2017") 359)
(check-expect (day-of-year "JAN 1 2017") 1)

(define (day-of-year date)
  (cond
    [(string=? january (get-month date))
               (get-day date)]
    [(string=? february (get-month date))
     (+ (get-day date) 31)]
    [(string=? march (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) 31)]
    [(string=? april (get-month date))
               (+ (is-leap-year? (get-year date))
                  (get-day date) (* 31 2))]
    [(string=? may (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 2) 30)]
    [(string=? june (get-month date))
               (+ (is-leap-year? (get-year date))
                  (get-day date) (* 31 3) 30)]
    [(string=? july (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 3) (* 30 2))]
    [(string=? august (get-month date))
               (+ (is-leap-year? (get-year date))
                  (get-day date) (* 31 4) (* 30 2))]
    [(string=? september (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 5) (* 30 2))]
    [(string=? october (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 5) (* 30 3))]
    [(string=? november (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 6) (* 30 3))]
    [(string=? december (get-month date))
     (+ (is-leap-year? (get-year date))
        (get-day date) (* 31 6) (* 30 4))]))

;; (is-leap-year?) produces 28 days in february if the year 
;;   cannot be perfectly divided by 4 or can be divided by 100
;;   and produces 29 days in february if the year can be divided
;;   by 4 or 400
;; is-leap-year?: Nat -> Nat

;; Examples:
(check-expect (is-leap-year? 2016) 29)
(check-expect (is-leap-year? 1100) 28)

(define (is-leap-year? yr)
  (cond
    [(= (remainder yr 400) 0) 29]
    [(= (remainder yr 100) 0) 28]
    [else
     (cond
       [(= (remainder yr 4) 0) 29]
       [else 28])]))

;; (get-month) produces the string of the month in the
;;   original string of the exact date
;; get-month: Str -> Str

;; Examples:
(check-expect (get-month "NOV 11 2089") "NOV")

(define (get-month month)
  (substring month 0 3))

;; (get-year) produces a number which is the year appeared
;;   in the string of the date
;; get-year: Str -> Nat

;; Examples:
(check-expect (get-year "FEB 9 2017") 2017)

(define (get-year year)
  (string->number (substring year
                             (- (string-length year) 4)
                             (string-length year))))

;; (get-day) produces the number of days in a month appeared
;;   in the string of the date
;; get-year: Str -> Nat

;; Examples:
(check-expect (get-day "NOV 9 2017") 9)

(define (get-day day)
  (string->number (substring day 4
                             (- (string-length day) 5))))

;; Tests:
(check-expect (day-of-year "DEC 31 2016") 366)
(check-expect (day-of-year "DEC 31 2017") 365)
(check-expect (day-of-year "DEC 31 2400") 366)
(check-expect (day-of-year "DEC 31 2200") 365)
(check-expect (day-of-year "FEB 25 2018") 56)
(check-expect (day-of-year "MAR 4 2018") 63)
(check-expect (day-of-year "MAR 4 2016") 64)
(check-expect (day-of-year "APR 9 2018") 99)
(check-expect (day-of-year "MAY 15 2020") 136)
(check-expect (day-of-year "JUN 23 2018") 174)
(check-expect (day-of-year "JUL 20 2016") 202)
(check-expect (day-of-year "AUG 15 2018") 227)
(check-expect (day-of-year "SEP 14 2018") 257)
(check-expect (day-of-year "OCT 9 2016") 283)
(check-expect (day-of-year "NOV 4 2018") 308)


