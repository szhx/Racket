;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 05, Problem 5
;;***************************************************
;;
(define-struct clock (hours mins))
(define (dur time1 time2)
  (cond
    [(< (clock-hours time1) (clock-hours time2))
     (+ (* 60 (- (clock-hours time2) (clock-hours time1)))
        (- (clock-mins time2) (clock-mins time1)))]
    [(> (clock-hours time1) (clock-hours time2))
     (+ (* 60 (- (+ 24 (clock-hours time2)) (clock-hours time1)))
        (- (clock-mins time2) (clock-mins time1)))]
    [(and (= (clock-hours time1) (clock-hours time2))
          (< (clock-mins time1) (clock-mins time2)))
     (- (clock-mins time2) (clock-mins time1))]
    [(and (= (clock-hours time1) (clock-hours time2))
          (> (clock-mins time1) (clock-mins time2)))
     (+ (* 60 (- (+ 24 (clock-hours time2)) (clock-hours time1)))
        (- (clock-mins time2) (clock-mins time1)))]
    [(and (= (clock-hours time1) (clock-hours time2))
          (= (clock-mins time1) (clock-mins time2)))
     0]))
    
               