;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 09, Problem 1
;;***************************************************
;;

;; (count sym lst) consumes a symbol and a list of symbols
;;   to produce a list that only contains the symbol given.
;; count: Sym (listof Sym) -> (listof Sym)
;; Example:
(check-expect (count 'a (list 'b 'c 'd)) empty)

(define (count sym lst)
  (filter (lambda (x) (equal? sym x)) lst))

;; (count-occurrences lst1 lst2) consumes 2 lists of symbols and produces
;;   a list of how many times that the elements in the first list
;;   can be found in the second list.
;; count-occurrences: (listof Sym) (listof Sym) -> (listof Nat)
;; Example:
(check-expect (count-occurrences (list 'a 'b) (list 'a)) (list 1 0))

(define (count-occurrences lst1 lst2)
  (map (lambda (x) (length (count x lst2))) lst1))

(check-expect (count-occurrences (list 'a 'b 'a 'q) (list 'r 'a 'b 'e 'b 'g))
              (list 1 2 1 0))
(check-expect (count-occurrences (list 'r 'a 'b 'e 'b 'g) (list 'a 'b 'a 'q))
              (list 0 2 1 0 1 0))
(check-expect (count-occurrences empty (list 'a 'b)) empty) 