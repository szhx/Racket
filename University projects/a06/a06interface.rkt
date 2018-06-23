;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a06interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Structure and Data Definitions for Questions 2 and 3

(define-struct fullname (first last))
;; A Fullname is a (make-fullname Str Str)

(define-struct student (id name grades))
;; A Student is a (make-student Nat Fullname (listof Num))
;; requires:
;;   id is a unique natural number representing the student id
;;   name is the fullname of the student
;;   grades is a non-empty list of student grades between 0 and 100 inclusive


;; Constants for Questions 2 and 3
;; You may or may not use these constants in your solution
(define st1 (make-student 1 (make-fullname "Joe" "Trudeau")
                          (list 100 93.2 71.4 84.6 78.45)))
(define st2 (make-student 2 (make-fullname "Keaton" "Abass")
                          (list 50 60 43 22.5 32.8)))
(define st3 (make-student 3 (make-fullname "Tolu" "Mandela")
                          (list 50 60 70 80 62 51 40)))
(define st4 (make-student 4 (make-fullname "Xi" "Mandela")
                          (list 2.5 5.5)))
(define st5 (make-student 5 (make-fullname "Gupta" "Merkel")
                          (list 65 62.5 69.3 88.54 61.2 54 74.3)))
(define st6 (make-student 6 (make-fullname "Tolu" "Mandela")
                          (list 88.5 99.8)))

