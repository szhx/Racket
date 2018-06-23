;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab03q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 03, Problem 5
;;***************************************************
;;

(define weekly-rate 74.95)
(define daily-rate 14.95)
(define (airport-parking day-num)
  (+ (* (quotient day-num 7) weekly-rate)
     (* (remainder day-num 7) daily-rate)))