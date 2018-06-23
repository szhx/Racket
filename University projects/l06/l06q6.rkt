;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 06, Problem 6
;;***************************************************
;;

(define (next-list alist item)
  (cond
    [(empty? alist) 'none]
    [(empty? (rest alist)) 'none]
    [(equal? (first alist) item)
     (first (rest alist))]
    [else (next-list (rest alist) item)]))