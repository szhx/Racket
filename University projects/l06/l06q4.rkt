;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 06, Problem 4
;;***************************************************
;;

(define (switch-case str)
  (list->string (change (string->list str))))

(define (change list)
   (cond
    [(empty? list) empty]
    [(char-upper-case? (first list))
     (cons (char-downcase (first list))
           (change (rest list)))]
    [(char-lower-case? (first list))
     (cons (char-upcase (first list))
           (change (rest list)))]
    [else (cons (first list) (change (rest list)))]))


     
     