;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a07q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 07, Problem 3
;;***************************************************
;;

;; A Token is a non-empty Str that contains only lowercase letters

(define-struct wordinfo (rank misspellings))
;; A WordInfo is a (make-wordinfo Nat (listof Token))
;; Requires:
;;    rank is a positive integer representing the frequency of the
;;       word as it is used in the English language
;;    misspellings is a list of common misspellings of the word

;; An Entry is a (list Token WordInfo)
;; where
;;   the first item is the key to the dictionary
;;   the second item is information associated with the key

;; A Dictionary is one of
;;   * empty
;;   * (cons Entry Dictionary)
;; Requires:
;;   keys are unique in the Dictionary
;;   keys cannot appear as entries in any misspellings
;;   lists in the Dictionary

;; Constants for testing
(define sample-dict
  (list (list "the" (make-wordinfo 1 (list "teh" "th")))
        (list "there" (make-wordinfo 53 (list "ther" "theer" "th" "teh")))))

;; (num-of-misspell tok entry) produces the number that a particular
;;   key (tok) matches the misspellings in the Dictionary (entry).
;; num-of-misspell: Token (listof Entry) -> Nat
;; Example:
(check-expect (num-of-misspell "th" sample-dict) 2)

(define (num-of-misspell tok entry)
  (cond
    [(empty? entry) 0]
    [(member tok (wordinfo-misspellings (second (first entry))))
     (add1 (num-of-misspell tok (rest entry)))]
    [else (num-of-misspell tok (rest entry))]))

;; (correct to diction) produces a string of the corrected spell
;;   where the misspelled Token (to) matches the misspellings in the
;;   Dictionary (diction)
;; correct: Token (listof Entry) -> Str
;; Example:
(check-expect (correct "th" sample-dict) "the")

(define (correct to diction)
  (cond
    [(empty? diction) empty]
    [(member to (wordinfo-misspellings (second (first diction))))
     (first (first diction))]
    [else (correct to (rest diction))]))

;; (auto-correct toke dic n) produces the corrected string when the Token (toke)
;;   matches the misspellings in the Dictionary (dic) and n is equal to 0, if n is
;;   not equal to 0, it will produce a list containing n list of the corrected
;;   string and its rank in the dictionary.
;; auto-correct: Token (listof Entry) Nat -> (Anyof Token (listof (listof Token Nat)))
;; Example:
(check-expect (auto-correct "th" sample-dict 2) (list (list "the" 1) (list "there" 53)))

(define (auto-correct toke dic n)
  (cond
    [(empty? dic) empty]
    [(= n 1)
     (correct toke dic)]
    [(> n 1)
     (cons (list (correct toke dic)
                 (wordinfo-rank (second (first dic))))
           (auto-correct toke (rest dic) n))]
    [else toke]))

;; (autocorrect token dictionary) is a wrapper funtion for the function
;;   auto-correct where we substitute the n in function auto-correct to
;;   the number of misspelling in the dictionary. It produces the given Token
;;   if the given Token does not exist in the misspells of the dictionary and
;;   produces the corrected Token if the given Token exists once, and produces
;;   a list of list of corrected Token and its rank.
;; autocorrect: Token (listof Entry) -> (Anyof Token (listof (listof Token Nat)))
;; Example:
(check-expect (autocorrect "a" sample-dict) "a")

(define (autocorrect token dictionary)
  (cond
    [(empty? dictionary) token]
    [else (auto-correct token dictionary (num-of-misspell token dictionary))]))

;;Tests:
(check-expect (autocorrect "theer" sample-dict) "there")
(check-expect (autocorrect "th" sample-dict) (list (list "the" 1) (list "there" 53)))
(check-expect (autocorrect "teh" sample-dict) (list (list "the" 1) (list "there" 53)))
(check-expect (autocorrect "teh" empty) "teh")


