;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 06, Problem 2
;;***************************************************
;;

(define (count-even-strings alist)
  (cond
    [(empty? alist) 0]
    [(= (remainder
         (string-length (first alist)) 2) 0)
     (+ 1 (count-even-strings (rest alist)))]
    [else (+ 0 (count-even-strings (rest alist)))]))