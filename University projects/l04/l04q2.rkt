;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 04, Problem 2
;;***************************************************
;;

(define (in-subset-1? x)
  (cond
    [(and (> x 3) (<= x 7))
     true]
    [else false]))

(define (in-subset-2? x)
  (cond
    [(or
      (and (> x 1) (< x 3))
      (and (> x 9) (< x 11)))
     true]
    [else false]))

(define (in-subset-3? x)
  (cond
    [(not
      (and (>= x 1) (<= x 3)))
     true]
    [else false]))
      