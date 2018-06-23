;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 06, Problem 3
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

;; (total lst) produces the sum of a list
;;   of numbers in lst
;; total: (listof Num) -> Num
;; Example:
(check-expect (total (list 3 9)) 12)

(define (total lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst)
             (total (rest lst)))]))

;; (elements alst) produces the number of elements
;;   in the alst
;; elements: (listof Num) -> Nat
;; Example:
(check-expect (elements (list 1 2 3 4 5)) 5)

(define (elements alst)
  (cond
    [(empty? alst) 0]
    [else (add1 (elements (rest alst)))]))

;; (average ali) is a wrapper function of total
;;   and elements and produces the average value of the
;;   numbers in ali list
;; average: (listof Num) -> Num
;; Example:
(check-expect (average (list 3 7 11)) 7)

(define (average ali)
  (/ (total ali) (elements ali)))

;;(select-students alist bound1 bound2) produces the id
;;   of students whose average grade are within the bound given
;; select-students: (listof Student) Num Num -> (listof Nat)
;; Example:
(check-expect (select-students (list st1 st2 st3 st4 st5) 80 50) (list 3 5))

(define (select-students alist bound1 bound2)
  (cond
    [(empty? alist) empty]
    [(and (< bound1 (average (student-grades (first alist))))
          (> bound2 (average (student-grades (first alist)))))
     (cons (student-id (first alist))
           (select-students (rest alist) bound1 bound2))]
    [(and (> bound1 (average (student-grades (first alist))))
          (< bound2 (average (student-grades (first alist)))))
     (cons (student-id (first alist))
           (select-students (rest alist) bound1 bound2))]
    [else (select-students (rest alist) bound1 bound2)]))

;; Tests:
(check-expect (select-students (list st5 st4 st3 st2 st1) 50 80) (list 5 3))
(check-expect (select-students (list st5 st4 st3 st2 st1) 80 50) (list 5 3))
(check-expect (select-students empty 0 100) empty)
(check-expect (select-students (list st5 st4 st3 st2 st1) 0 100) (list 5 4 3 2 1))