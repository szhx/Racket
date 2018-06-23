;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname labinterface10) (read-case-sensitive #t) (teachpacks ((lib "potatohead.rkt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "potatohead.rkt" "installed-teachpacks")) #f)))
(define-struct binode (op arg1 arg2))
;; A Binary arithmetic expression Internal Node (BINode) 
;;      is a (make-binode (anyof '* '+ '/ '-) BinExp BinExp) 

;;A Binary arithmetic expression (BinExp) is one of:
;; * a Num
;; * a BINode


(define-struct node (key val left right))
;; A binary search tree (BST) is either
;; * empty, or
;; * a (make-node Num Str BST BST)
;;   which satisfies the "ordering property" recursively:
;;   * every key in left is less than key
;;   * every key in right is greater than key

;; Lab 10, Question 2
(define (count-ops ex)
  ...)

;; Lab 10, Question 3

(define (is-ancestor-of? b k1 k2)
  ...)

;; Lab 10, Question 4

(define (leftmost btree)
  ...)
