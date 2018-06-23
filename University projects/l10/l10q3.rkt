;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l10q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node (key val left right))

(define (is-ancestor-of? b k1 k2)
  (cond
    [(empty? b) false]
    [(equal? (find-k (find-k b k1) k2) empty) false]
    [else true]))
             

(define (find-k bst k)
  (cond
    [(empty? bst) empty]
    [(= k (node-key bst)) bst]
    [(< k (node-key bst))
     (find-k (node-left bst) k)]
    [else (find-k (node-right bst) k)])) 