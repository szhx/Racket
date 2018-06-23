;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 05, Problem 4
;;***************************************************
;;
(define-struct card (value suit))
(define (big-card-small-suit card1 card2)
  (cond
    [(< (card-value card1) (card-value card2))
    (make-card (card-value card2)
    (card-suit card1))]
    [(< (card-value card2) (card-value card1))
    (make-card (card-value card1)
    (card-suit card2))]
    [else card1]))