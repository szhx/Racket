;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 04, Problem 2
;;***************************************************
;;

(define-struct triangle (equality sharpness a1 a2 a3))
;; A Triangle is a (make-triangle Sym Sym Num Num Num)
;; Requires:
;;   equality is 'equilateral, 'isosceles, or 'scalene
;;   sharpness is 'acute, 'obtuse, or 'right
;;   the sum of a1, a2, and a3 is 180.
;;   a1, a2, and a3 are all > 0.

;; Template for Triangle function
;; my-triangle-fun: Triangle -> Any
(define (my-triangle-fun atriangle)
  (... (triangle-equality atriangle) ...
       (triangle-sharpness atriangle) ...
       (triangle-a1 atriangle) ...
       (triangle-a2 atriangle) ...
       (triangle-a3 atriangle) ...))
