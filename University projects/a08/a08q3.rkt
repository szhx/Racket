;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a08q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 08, Problem 3
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

(define-struct node (rank word))
;; A Node is a (make-node Nat Token) with the same requirements as WNode.

;; (search-word to1 dic1) produces true or false that the given string
;;   to1 appears in the word part of dictionary.
;; search-word: Str BST-Dictionary -> Bool
;; Example:
(check-expect (search-word "the" bst-d) true)

(define (search-word to1 dic1)
  (cond
    [(empty? dic1) false]
    [(equal? to1 (wnode-word dic1)) true]
    [(or (search-word to1 (wnode-left dic1))
         (search-word to1 (wnode-right dic1))) true]
    [else false]))

;; (search-misspellings-num to2 dic2) produces the number of
;;   times that the given misspelling appears in the dictionary.
;; search-misspellings-num: Str BST-Dictionary -> Nat
;; Example:
(check-expect (search-misspellings-num "th" bst-d) 2)

(define (search-misspellings-num to2 dic2)
  (cond
    [(empty? dic2) 0]
    [(member? to2 (wnode-misspellings dic2))
     (+ 1 (search-misspellings-num to2 (wnode-left dic2))
        (search-misspellings-num to2 (wnode-right dic2)))]
    [else (+ (search-misspellings-num to2 (wnode-left dic2))
        (search-misspellings-num to2 (wnode-right dic2)))]))

;; (search-misspellings to3 dic3) produces a list of Node that
;;   the given misspelling appears in them. All the Node are
;;   got from the given dictionary and the Node contains the rank
;;   and the word as it appeared in the dictionary.
;; search-misspellings: Str BST-Dictionary -> (listof Node)
;; Example:
(check-expect (search-misspellings "th" bst-d)
              (cons (make-node 38 "there") (cons (make-node 1 "the") empty)))

(define (search-misspellings to3 dic3)
  (cond
    [(empty? dic3) empty]
    [(member? to3 (wnode-misspellings dic3))
     (append (cons (make-node (wnode-rank dic3) (wnode-word dic3)) empty)
            (search-misspellings to3 (wnode-left dic3))
            (search-misspellings to3 (wnode-right dic3)))]
    [else (append (search-misspellings to3 (wnode-left dic3))
                  (search-misspellings to3 (wnode-right dic3)))]))

;; (rank list) produces the list produced by the function search-
;;   misspellings with the lowest rank.
;; rank: (listof Node) -> (listof Node)
;; Example:
(check-expect (rank (cons (make-node 38 "there")
                          (cons (make-node 1 "the") empty)))
              (cons (make-node 1 "the") empty))

(define (rank list)
  (cond
    [(empty? (rest list)) list]
    [(< (node-rank (first list)) (node-rank (second list)))
     (rank (cons (first list) (rest (rest list))))]
    [else (rank (rest list))]))

;; (best-autocorrect token bst) produces the word if the token
;;   given appeared as the correct word in the dictionary and also
;;   produces the corresponding word for the misspelling if it is
;;   is a member of the misspellings in the dictionary. If the misspelling
;;   appears more than once, then produce the word with lowest rank.
;;   If the given token does not appear in the dictionary, we produce
;;   false.
;; best-autocorrect: Token BST-Dictionary -> Str
;; Example:
(check-expect (best-autocorrect "th" bst-d) "the")

(define (best-autocorrect token bst)
  (cond
    [(empty? bst) false]
    [(search-word token bst) token]
    [(= (search-misspellings-num token bst) 1)
     (node-word (first (search-misspellings token bst)))]
    [(> (search-misspellings-num token bst) 1)
     (node-word (first (rank (search-misspellings token bst))))]
    [else false]))

;; Tests:
(check-expect (best-autocorrect "theer" empty) false)
(check-expect (best-autocorrect "theer" bst-d) "there")
(check-expect (best-autocorrect "there" bst-d) "there")
(check-expect (best-autocorrect "boy" bst-d) false)

      