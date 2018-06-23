;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 09, Problem 2
;;***************************************************
;;

;; (power-sum m n) produces the a sum of m to the power from 0 to n.
;; power-sum: Nat Nat -> Nat
;; Example:
(check-expect (power-sum 1 3) 4)

(define (power-sum m n)
  (foldr + 0 (map (lambda (y) (expt m y))
                  (cons 0 (build-list n add1)))))

;; (power-product m n) produces the product of m to the power from
;;   0 to n.
;; power-product: Nat Nat -> Nat
;; Example:
(check-expect (power-product 1 9) 1)

(define (power-product m n)
  (foldr * 1 (map (lambda (y) (expt m y))
                  (cons 0 (build-list n add1)))))

;; (list-of-sumprods M n sym) consumes 2 natural number M and n
;;   and a symbol to produce a list up to sum of M to the power up
;;   to n when the symbol is 'sum and produce the product of M to
;;   the power up to n otherwise.
;; list-of-sumprods: Nat Nat Sym -> (listof Nat)
;; Examples:
(check-expect (list-of-sumprods 2 3 'sum) (list 4 15))
(check-expect (list-of-sumprods 2 3 'prod) (list 1 64))

(define (list-of-sumprods M n sym)
  (cond
    [(equal? sym 'sum)
     (map (lambda (x) (power-sum x n)) (build-list M add1))]
    [else (map (lambda (w) (power-product w n))
               (build-list M add1))]))

;; Tests:
(check-expect (list-of-sumprods 5 1 'sum) (list 2 3 4 5 6))
(check-expect (list-of-sumprods 0 4 'prod) empty)
(check-expect (list-of-sumprods 4 0 'sum) (list 1 1 1 1))   