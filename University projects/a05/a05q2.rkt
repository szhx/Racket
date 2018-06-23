;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 05, Problem 2
;;***************************************************
;;

;; (total-length alist) produces the total length of all the
;;   string in the list.
;; total-length: (listof Str) -> Nat
;; Example:
(check-expect (total-length
               (cons "sugar" (cons "CS" (cons "Logic Design"
                                              (cons "University" (cons "Waterloo" empty)))))) 37)

(define (total-length alist)
  (cond
    [(empty? alist) 0]
    [else (+ (string-length (first alist))
             (total-length (rest alist)))]))

;; (string-num al) produces the number of strings in one list.
;; string-length: (listof Str) -> Nat
;; Example:
(check-expect (string-num
               (cons "sugar" (cons "CS" (cons "Logic Design"
                                              (cons "University" (cons "Waterloo" empty)))))) 5)

(define (string-num al)
  (cond
    [(empty? al) 0]
    [else (+ 1 (string-num (rest al)))]))

;; (average-length ali) produces the average length of the a list
;;   of strings and is also the wrapper function for the function
;;   total-length and string-num.
;; average-length: (listof Str) -> Num
;; Example:
(check-expect (average-length (cons "sugar" (cons "CS" (cons "Logic Design"
                                                             (cons "University" (cons "Waterloo" empty)))))) 7.4)

(define (average-length ali)
  (/ (total-length ali) (string-num ali)))

;; (longer? alon average) produces a list of boolean values for each of
;;   the string in the list. If the string length is longer than the average
;;   length of all the string then produces true and false otherwise.
;; longer?: (listof Str) Num -> (listof Bool)
;; Example:
(check-expect (longer? (cons "sugar" (cons "CS" (cons "Logic Design"
                                         (cons "University" (cons "Waterloo" empty))))) 7.4)
              (cons false (cons false (cons true (cons true (cons true empty))))))

(define (longer? alon average)
  (cond
    [(empty? alon) empty]
    [(> (string-length (first alon)) average)
     (cons true (longer? (rest alon) average))]
    [else (cons false (longer? (rest alon) average))]))

;; (strings-to-bool los) is the wrapper function for longer? that consumes
;;   only a list of string which produces true if the string length in the
;;   list is longer than the average length of strings in the list and false
;;   otherwise.
;; string-to-bool: (listof Str) -> (listof Bool)
;; Example:
(check-expect (strings-to-bool (cons "sugar" (cons "CS" (cons "Logic Design"
                                                             (cons "University" (cons "Waterloo" empty))))))
              (cons false (cons false (cons true (cons true (cons true empty))))))

(define (strings-to-bool los)
  (longer? los (average-length los)))

;; Tests:
(check-expect (strings-to-bool (cons "sugar" (cons "CS000" (cons "Logic"
                                                             (cons "Unive" (cons "Water" empty))))))
              (cons false (cons false (cons false (cons false (cons false empty))))))
(check-expect (strings-to-bool (cons "sugar0" (cons "CS000" (cons "Logic"
                                                             (cons "Unive" (cons "Water" empty))))))
              (cons true (cons false (cons false (cons false (cons false empty))))))
