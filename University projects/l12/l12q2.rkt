;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l12q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct ainode (op args))
;; An Arithmetic expression Internal Node (AINode) is a
;;   (make-ainode (anyof '* '+) (listof AExp))

;;An Airthmetic expression (AExp) is one of:
;;  * a Num
;;  * an AINode

(define (swap-ops ex)
  (cond
    [(number? ex) ex]
    [(equal? (ainode-op ex) '*)
     (make-ainode '+ (switch (ainode-args ex)))]
    [else (make-ainode '* (switch (ainode-args ex)))]))

(define (switch ex)
  (cond
    [(empty? ex) empty]
    [else (cons (swap-ops (first ex))
                (switch (rest ex)))]))