;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a07q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 07, Problem 2
;;***************************************************
;;

;; (wrap lst n b) produces a list of characters by using a
;;   list of characters and 2 natural numbers n and b.
;;   The old list is inserted with a new character called
;;   the newline after each n characters of
;;   the list. 
;; wrap: (listof Char) Nat Nat -> (listof Char)
;; Example:
(check-expect (wrap (list #\a #\w #\B) 2 2) (list #\a #\w #\newline #\B))

(define (wrap lst n b)
  (cond
    [(empty? lst) empty]
    [(and (= n 0) (< (length lst) b))
     (cons #\newline lst)]
    [(and (= n 0) (>= (length lst) b))
     (cons #\newline (wrap lst (+ n b) b))]
    [(> n 0)
     (cons (first lst) (wrap (rest lst) (sub1 n) b))]))

;; (word-wrap str width) produces a new string and is
;;   a wrapper funtion for (wrap lst n b) where the
;;   characters in the str are the same as that
;;   in the lst and width is a natural number and is
;;   equal to both n and b. The function is to seperate
;;   the string into parts and each with a width
;;   as the natural number of width required.
;; word-wrap: Str Nat -> Str
;; Requires: the string is non-empty
;; Example:
(check-expect (word-wrap "abcdefg" 4) "abcd\nefg")

(define (word-wrap str width)
  (list->string (wrap (string->list str) width width)))

;;Tests:
(check-expect (word-wrap "jfsiafo" 10) "jfsiafo")
(check-expect (word-wrap "abcdefghi" 2) "ab\ncd\nef\ngh\ni")
(check-expect (word-wrap "  " 1) " \n ")



    
