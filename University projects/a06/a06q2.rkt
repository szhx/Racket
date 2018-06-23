;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 06, Problem 2
;;***************************************************
;;

(define-struct fullname (first last))
;; Template for my-fullname-fn
;; my-fullname-fn: Fullname -> Any
(define (my-fullname-fn aname)
  (... (fullname-first aname) ...
       (fullname-last aname) ...))

(define-struct student (id name grades))
;; Template for my-student-fn
;; my-fullname-fn: Student -> Any
(define (my-student-fn astudent)
  (... (student-id astudent) ...
       (student-name astudent) ...
       (student-grades astudent) ...))

;; Constants for test:
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
(define st7 (make-student 3 (make-fullname "Tolu" "Mandela")
                          (list 88.5 99.8)))

;; (insert n alist) produces a list of Student which insert
;;   Student n into the alist by comparing the alphabetic
;;   order of its last name, if the last names are equal,
;;   then compare the first names, then the id number
;; insert: Student (listof Student) -> (listof Student)
;; Examples:
(check-expect (insert st1 (list st3 st5)) (list st3 st5 st1))

(define (insert n alist)
  (cond
    [(empty? alist) (cons n empty)]
    [(string>? (fullname-last (student-name n))
               (fullname-last (student-name (first alist))))
     (cons (first alist) (insert n (rest alist)))]
    [(string<? (fullname-last (student-name n))
               (fullname-last (student-name (first alist))))
     (cons n alist)]
    [else
     (cond
       [(string>? (fullname-first (student-name n))
                  (fullname-first (student-name (first alist))))
        (cons (first alist) (insert n (rest alist)))]
       [(string<? (fullname-first (student-name n))
                  (fullname-first (student-name (first alist))))
        (cons n alist)]
       [else
        (cond
          [(> (student-id n) (student-id (first alist)))
           (cons (first alist) (insert n (rest alist)))]
          [else
           (cons n alist)])])]))

;; (sort-students alist) produces a list of Student which the
;;   Student is sorted by the alphabetic order of their last name,
;;   and if they have the same last name, then sort alphabetically by
;;   the first name, if the first names are the same then sorted by
;;   their id.
;; sort-students: (listof Student) -> (listof Student)
;; Example:
(check-expect (sort-students (list st1 st3 st5)) (list st3 st5 st1))

(define (sort-students alon)
  (cond
    [(empty? alon) empty]
    [else (insert (first alon) (sort-students (rest alon)))]))
  
;; Tests:  
(check-expect (sort-students (list st1 st2 st3 st4 st5)) (list st2 st3 st4 st5 st1))
(check-expect (sort-students (list st6 st4 st3)) (list st3 st6 st4))
(check-expect (sort-students (list st7 st3)) (list st7 st3))
