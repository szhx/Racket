;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 01, Problem 1
;;***************************************************
;;

(define acce1 9.8)
(define (time-to-ground v h)
  (/ (- v (sqrt (- (sqr v)
                   (* 4 h (/ (- 0 acce1) 2)))))
     (* 2 (/ (- 0 acce1) 2))))