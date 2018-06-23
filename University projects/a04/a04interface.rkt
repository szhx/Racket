;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Question 1

(define-struct particle (type energy))
;; A Particle is a (make-particle Sym Num)
;; Requires:
;;   type is 'photon, 'electron, or 'positron
;;   energy is positive

(define (collide p1 p2)
  ...)   


;; Question 2

(define-struct triangle (equality sharpness a1 a2 a3))
;; A Triangle is a (make-triangle Sym Sym Num Num Num)
;; Requires:
;;   equality is 'equilateral, 'isosceles, or 'scalene
;;   sharpness is 'acute, 'obtuse, or 'right
;;   the sum of a1, a2, and a3 is 180.
;;   a1, a2, and a3 are all > 0.


;; Question 3

(define (complete-triangle a1 a2)
  ...)


;; Question 4

;; A Book-Price is (anyof Num false), where it is a number >= 0 if the 
;;   book is available in the associated format, and false otherwise.


(define-struct book-purchase (hardcover softcover ebook))
;; A Book-Purchase is a 
;;   (make-book-purchase Book-Price Book-Price Book-Price)
;; Requires:
;;   hardcover, softcover, and ebook, are the prices of the book if it
;;     is available in the respective formats, and false otherwise.


(define-struct textbook (title online purchase))
;; A Textbook is a (make-textbook Str Str Book-Purchase), 
;; Requires:
;;   title is nonempty.
;;   online is the empty string if the textbook is not available 
;;     online; otherwise, it is the URL for the online text.
;;   purchase provides the prices for the book in hardcover, 
;;     softcover, and ebook format (if they are available).

(define (cheapest-method text)
  ...)   
