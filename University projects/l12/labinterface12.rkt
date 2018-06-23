;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname labinterface12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct tnode (label children))
;; A General Tree (GenTree) is one of
;;   * a Str or
;;   * a (make-tnode Str Tree-List)

;;A Tree-List is one of
;;  * (cons GenTree empty)
;;  * (cons GenTree Tree-List)

(define-struct ainode (op args))
;; An Arithmetic expression Internal Node (AINode) is a
;;   (make-ainode (anyof '* '+) (listof AExp))

;;An Airthmetic expression (AExp) is one of:
;;  * a Num
;;  * an AINode

;;A leaf-labelled tree (LLT) is one of
;;  * empty
;;  * (cons Num LLT)
;;  * (cons LLT LLT) where the first LLt is non-empty
  

;; Lab 12, Question 2

(define (swap-ops ex)
  ...)

;; Lab 12, Question 3

(define (llt-count info LLT)
  ...)

;; Lab 12, Question 4
(define (applyx fn args xval)
  ...)

(define (evalx avx xval)
 ...)

