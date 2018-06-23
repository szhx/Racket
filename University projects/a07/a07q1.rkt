;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a07q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 07, Problem 1
;;***************************************************
;;

;; (upcase string) produces the upper-case letter for the
;;   alphabetic character in the string
;; upcase: Str -> Str
;; Requires: the string only contains one alphabetic character
;; Example:
(check-expect (upcase "a") "A")

(define (upcase string)
  (list->string (cons (char-upcase
                       (first (string->list string))) empty)))

;; (decode code key) produces the a string of upper-case letters
;;   by using a list of string (code) and a list of natural numbers
;;   (key), the element in the key is which represents
;;   the index position of the element in the code and what we want
;;   is the alphabetic character at that index position and if there
;;   is no alphabetic character at that position, then the
;;   code is invalid, also, if the key is longer than the string
;;   length of the matching code, then it is also invalid.
;; decode: (listof Str) (listof Nat) -> Str
;; Example:
(check-expect (decode (list "ab g" "of" "#hi?" "C" "as?") (list 3 0 0 5 1 4)) "GOCS")

(define (decode code key)
  (cond
    [(or (empty? code) (empty? key)) ""]
    [(> (string-length (first code)) (first key))
     (cond
       [(string-alphabetic?
         (substring (first code)
                    (first key) (add1 (first key))))
        (string-append (upcase (substring
                                (first code) (first key)
                                (add1 (first key))))
                       (decode (rest code) (rest key)))]
       [else (decode (rest code) key)])]
    [else (decode code (rest key))]))

;; Tests:
(check-expect (decode empty (list 2 5)) "")
(check-expect (decode (list "a") empty) "")
(check-expect (decode (list "s" "h" "u" "t") (list 0 0 0 0)) "SHUT")
(check-expect (decode (list "B" "A" "B" "Y") (list 0 0 0 0)) "BABY")
(check-expect (decode (list "@" "1%") (list 0 1)) "")
(check-expect (decode (list "abuis" "fmmc") (list 8 15)) "")
