;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 05, Problem 3
;;***************************************************
;;

;; (remove-it alist) produces a list of characters and any vowels
;;   like "aeiouAEIOU" in the list should be removed and other
;;   characters will remain the same.
;; remove-it: (listof Char) -> (listof Char)
;; Example:
(check-expect (remove-it (cons #\a (cons #\d (cons #\e empty)))) (cons #\d empty))

(define (remove-it alist)
  (cond
    [(empty? alist) empty]
    [(equal? (first alist) #\a) (remove-it (rest alist))]
    [(equal? (first alist) #\e) (remove-it (rest alist))]
    [(equal? (first alist) #\i) (remove-it (rest alist))]
    [(equal? (first alist) #\o) (remove-it (rest alist))]
    [(equal? (first alist) #\u) (remove-it (rest alist))]
    [(equal? (first alist) #\A) (remove-it (rest alist))]
    [(equal? (first alist) #\E) (remove-it (rest alist))]
    [(equal? (first alist) #\I) (remove-it (rest alist))]
    [(equal? (first alist) #\O) (remove-it (rest alist))]
    [(equal? (first alist) #\U) (remove-it (rest alist))]
    [else (cons (first alist) (remove-it (rest alist)))]))

;; (remove-vowels phrase) is the wrapper function for remove-it
;;   and it consumes a string and produces a string with all the vowels
;;   being removed.
;; remove-vowels: Str -> Str
;; Example:
(check-expect (remove-vowels "University of Waterloo is awesome!")
              "nvrsty f Wtrl s wsm!")

(define (remove-vowels phrase)
  (list->string (remove-it (string->list phrase))))

;; Tests:
(check-expect (remove-vowels "") "")
(check-expect (remove-vowels "Uiei o aeoo i aeoe") "    ")
(check-expect (remove-vowels "Amb") "mb")
(check-expect (remove-vowels "Ef") "f")
(check-expect (remove-vowels "INF") "NF")
(check-expect (remove-vowels "Omg") "mg")
(check-expect (remove-vowels "Uwp") "wp")
(check-expect (remove-vowels "afff") "fff")
(check-expect (remove-vowels "ewh") "wh")
(check-expect (remove-vowels "fiw") "fw")
(check-expect (remove-vowels "Good") "Gd")
(check-expect (remove-vowels "wudf") "wdf")
(check-expect (remove-vowels "kqfgh") "kqfgh")


    