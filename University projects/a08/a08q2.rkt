;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a08q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 08, Problem 2
;;***************************************************
;;

; A Token is a Str that contains only lowercase letters.

(define-struct wnode (rank word misspellings left right))
; A WNode is a
;      (make-wnode Nat Token (listof Token) BST-Dictionary BST-Dictionarye)
; requires
; rank is a positive integer representing the frequency of word
;      as it is used in the English language
; misspellings is a list of common misspellings of word

; A BST-Dictionary is one of
; * empty
; * (make-wnode Nat Token (listof Token) BST-Dictionary BST-Dictionary)
;   where the rank of all tokens in left are less than rank of root
;     and the rank of all tokens in right are greater than rank of root
;     and all rank values are unique (no duplicates)
;     and no Token appearing as a word in BST-Dictionary will occur
;         in a misspelling list. 


;; Sample data: 
(define bst-d
  (make-wnode 38 "there" (list "ther" "theer" "th")
              (make-wnode 1 "the" (list "teh" "th")
                          empty
                          empty)
              (make-wnode 72 "then" (list "thn" "ther")
                          empty
                          empty)))
(define bst-d1
  (make-wnode 38 "there" (list "ther" "theer" "th")
              (make-wnode 1 "the" (list "teh" "th")
                          empty
                          (make-wnode 24 "that" (list "tha" "thta" "tht")
                                      empty empty))
              (make-wnode 72 "then" (list "thn" "ther")
                          empty
                          empty)))

;; (reverse-rank-order bst) produces a list of correct spelled
;;   words in the dictionary that is in the order of descending rank.
;; reverse-rank-order: BST-Dictionary -> (listof Str)
;; Example:
(check-expect (reverse-rank-order empty) empty)

(define (reverse-rank-order bst)
  (cond
    [(empty? bst) empty]
    [(and (empty? (wnode-left bst))
          (empty? (wnode-right bst)))
     (list (wnode-word bst))]
    [(empty? (wnode-right bst))
     (append (list (wnode-word bst))
             (reverse-rank-order (wnode-left bst)))]
    [(empty? (wnode-left bst))
     (append (reverse-rank-order (wnode-right bst))
             (list (wnode-word bst)))]
    [else (append (reverse-rank-order (wnode-right bst))
                  (list (wnode-word bst))
                  (reverse-rank-order (wnode-left bst)))]))

;; Tests:
(check-expect (reverse-rank-order bst-d1)
              (cons "then" (cons "there" (cons "that" (cons "the" empty)))))
(check-expect (reverse-rank-order bst-d)
              (cons "then" (cons "there" (cons "the" empty))))
(check-expect (reverse-rank-order
               (make-wnode 3 "beijing" (list "beijin" "biejing") empty empty))
              (cons "beijing" empty))
(check-expect (reverse-rank-order  (make-wnode 38 "there" (list "ther" "theer" "th")
              (make-wnode 1 "the" (list "teh" "th")
                          empty empty) empty)) (list "there" "the"))
