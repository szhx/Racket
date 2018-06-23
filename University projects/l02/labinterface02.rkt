;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname labinterface02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 00, Problem 1
;;***************************************************
;;

;; Lab 2, Question 4

(define (onehalf nbr)
  (quotient nbr 2))

;; Lab 2, Question 5

(define (middle-digit nnn)
  (remainder (quotient nnn 10) 10))

;; Lab 2, Question 6

(define (set-middle-to-zero nnn)
  (- nnn (* (remainder
             (quotient nnn 10) 10) 10)))


