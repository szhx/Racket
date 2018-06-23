;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 05, Problem 2
;;***************************************************
;;
(define-struct timer (hours mins secs))
(define (convert-time t)
  (+ (* 60 60 (timer-hours t))
     (* 60 (timer-mins t))
     (timer-secs t)))
