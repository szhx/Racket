;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l12q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct tnode (label children))
;; A General Tree (GenTree) is one of
;;   * a Str or
;;   * a (make-tnode Str Tree-List)

;;A Tree-List is one of
;;  * (cons GenTree empty)
;;  * (cons GenTree Tree-List)

(define-struct ainode (op args))
;; An Arithmetic expression Internal Node (AINode) is a
;;   (make-ainode (anyof '* '+) (listof AVEx))

;;An Airthmetic expression (AExp) is one of:
;;  * a Num
;;  * an AINode

;;A leaf-labelled tree (LLT) is one of
;;  * empty
;;  * (cons Num LLT)
;;  * (cons LLT LLT) where the first LLt is non-empty


;; Lab 12, Question 4
;; An arithmetic expression with varaibles (AVEx) is one of:
;; Num
;; 'x
;; AINode
(define (applyx fn args xval)
  (cond
    [(empty? args) (cond
                     [(equal? fn '*) 1]
                     [(equal? fn '+) 0])]
    [else (cond
            [(equal? fn '*)
             (* (evalx (first args) xval) (applyx fn (rest args) xval))]
            [(equal? fn '+)
             (+ (evalx (first args) xval) (applyx fn (rest args) xval))])]))
  

(define (evalx avx xval)
  (cond
    [(number? avx) avx]
    [(equal? 'x avx) xval]
    [else (applyx (ainode-op avx) (ainode-args avx) xval)]))
   
