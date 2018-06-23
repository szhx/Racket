;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a08q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 08, Problem 1
;;***************************************************
;;

(define-struct node (item left right))
; A Node is a (make-node Num BT BT)
; A binary tree (BT) is either
; empty
; (make-node Num BT BT)

;; Constants for testing:
(define bt1
  (make-node 80
             (make-node 41 (make-node 16 empty
                                                  (make-node 25 empty empty))
                        (make-node 53 (make-node 46
                                                 (make-node 42 empty empty) empty)
                                   (make-node 55 empty empty)))
             (make-node 74 (make-node 65 (make-node 63 (make-node 62 empty empty)
                                                    (make-node 64 empty empty))
                                               (make-node 70 empty empty)) empty)))
(define bt2
  (make-node 3 (make-node 5 empty empty) empty))
(define bt3
  (make-node 4 empty (make-node 6 empty empty)))
(define bt4
  (make-node 4 (make-node 5 empty empty) (make-node 6 empty empty)))
(define bt5
  (make-node 5 (make-node 5 empty empty)
             (make-node 6 (make-node 4 empty empty) empty)))
(define bt6
  (make-node 1 (make-node 4 (make-node 3 empty empty) empty)
             (make-node 5 (make-node 3 empty empty) (make-node 4 empty empty))))
(define bt7
  (make-node 1 (make-node 2 (make-node 4 empty empty)
                          (make-node 3 empty empty))
             (make-node 3 empty empty)))

;; (track-num bt) produces how many leaves are there
;;   in a binary tree.
;; track-num: BT -> Nat
;; Example:
(check-expect (track-num bt1) 14)

(define (track-num bt)
  (cond
    [(empty? bt) 0]
    [(and (empty? (node-left bt))
          (empty? (node-right bt))) 1]
    [else (+ 1 (track-num (node-left bt))
             (track-num (node-right bt)))]))

;; (size bt) produces the number of times that the difference of
;;   the number of nodes of 2 side of the binary tree is larger than
;;   1, this will track all the subtree of the main binary tree, and
;;   add 1 when ever the difference of the number of nodes is larger than 1.
;; size: BT -> Nat
;; Example:
(check-expect (size bt1) 3)

(define (size bt)
  (cond
    [(or (= (track-num bt) 0)
         (= (track-num bt) 1)) 0]
    [(or (and (<= (- (track-num (node-left bt))
                     (track-num (node-right bt))) 1)
              (>= (- (track-num (node-left bt))
                     (track-num (node-right bt))) 0))
         (and (<= (- (track-num (node-right bt))
                     (track-num (node-left bt))) 1)
              (>= (- (track-num (node-right bt))
                     (track-num (node-left bt))) 0)))
     (+ (size (node-left bt))
        (size (node-right bt)))]
    [else (+ 1 (size (node-left bt))
             (size (node-right bt)))]))

;; (size-balance? bt) produces if it is true that the binary
;;   tree and all of its subtrees have a difference of number of
;;   nodes that is less than or equal to 1 and larger than or
;;   equal to zero.
;; size-balance?: BT -> Bool
;; Example:
(check-expect (size-balanced? bt1) false)

(define (size-balanced? bt)
  (cond
    [(> (size bt) 0) false]
    [else true]))

;; Tests:
(check-expect (size-balanced? empty) true)
(check-expect (size-balanced? (make-node 3 empty empty)) true)
(check-expect (size-balanced? bt2) true)
(check-expect (size-balanced? bt3) true)
(check-expect (size-balanced? bt4) true)
(check-expect (size-balanced? bt5) true)
(check-expect (size-balanced? bt6) true)
(check-expect (size-balanced? bt7) false)

