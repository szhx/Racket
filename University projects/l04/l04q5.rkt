;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 04, Problem 5
;;***************************************************
;;

(define (connect? string1 string2)
  (cond
    [(string=? (substring string1
                          (- (string-length string1) 1)
                          (string-length string1))
               (substring string2 0 1))
     true]
    [else false]))
     
                         