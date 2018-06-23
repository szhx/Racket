;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a08-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; ----------
;; Question 1
;; ----------

(define-struct node (item left right))
; A Node is a (make-node Num BT BT)
; A binary tree (BT) is either
; empty
; (make-node Num BT BT)


;; -----------------
;; Questions 2 and 3
;; -----------------

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

