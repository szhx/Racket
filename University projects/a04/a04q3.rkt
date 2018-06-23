;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 04, Problem 3
;;***************************************************
;;

(define-struct triangle (equality sharpness a1 a2 a3))
;; A Triangle is a (make-triangle Sym Sym Num Num Num)
;; Requires:
;;   equality is 'equilateral, 'isosceles, or 'scalene
;;   sharpness is 'acute, 'obtuse, or 'right
;;   the sum of a1, a2, and a3 is 180.
;;   a1, a2, and a3 are all > 0.

;; Template for Triangle function
;; my-triangle-fun: Triangle -> Any
(define (my-triangle-fun atriangle)
  (... (triangle-equality atriangle) ...
       (triangle-sharpness atriangle) ...
       (triangle-a1 atriangle) ...
       (triangle-a2 atriangle) ...
       (triangle-a3 atriangle) ...))

;; (equality? angle1 angle2) produces the equality of the triangle
;;   which is one of equilateral, isosceles and scalene
;;   and this is done by compare between the 3 angles of the triangle.
;; equality?: Num Num -> Sym
;; Example：
(check-expect (equality? 40 70) 'isosceles)

(define (equality? angle1 angle2)
  (cond
    [(and (= angle1 angle2)
          (= angle2
                  (- 180 (+ angle1 angle2))))
     'equilateral]
    [(or (= angle1 angle2)
         (= angle1
                 (- 180 (+ angle1 angle2)))
         (= angle2
                 (- 180 (+ angle1 angle2))))
     'isosceles]
    [else 'scalene]))

;; (sharpness? tria1 tria2) produces the if the angles in a triangle
;;   are all acute or there exists a angle that is obtuse or
;;   right angle in the triangle.
;; sharpness: Num Num -> Symbol
;; Example:
(check-expect (sharpness? 54 64) 'acute)

(define (sharpness? tria1 tria2)
  (cond
    [(and (< tria1 90)
          (< tria2 90)
          (< (- 180 (+ tria1 tria2)) 90))
     'acute]
    [(or (< 90 tria1)
         (< 90 tria2)
         (< 90 (- 180 (+ tria1 tria2))))
     'obtuse]
    [(or (= 90  tria1)
         (= 90  tria2)
         (= 90 (- 180 (+ tria1 tria2))))
     'right]))

;; (complete-triangle a1 a2) produces a Triangle contains 
;;   its equality, sharpness and the degree of its 3 angles
;; complete-triangle: Num Num -> Triangle
;; Example:
(check-expect (complete-triangle 45 90)
              (make-triangle 'isosceles 'right 45 90 45)) 

(define (complete-triangle a1 a2)
  (make-triangle (equality? a1 a2)
                 (sharpness? a1 a2) a1 a2
                 (- 180 (+ a1 a2))))

;; Tests:
(check-expect (complete-triangle 45 45)
              (make-triangle 'isosceles 'right 45 45 90))
(check-expect (complete-triangle 60 60)
              (make-triangle 'equilateral 'acute 60 60 60))
(check-expect (complete-triangle 70 40)
              (make-triangle 'isosceles 'acute 70 40 70))
(check-expect (complete-triangle 75 75)
              (make-triangle 'isosceles 'acute 75 75 30))
(check-expect (complete-triangle 40 40)
              (make-triangle 'isosceles 'obtuse 40 40 100))
(check-expect (complete-triangle 120 30)
              (make-triangle 'isosceles 'obtuse 120 30 30))
(check-expect (complete-triangle 58 62)
              (make-triangle 'scalene 'acute 58 62 60))
(check-expect (complete-triangle 43 27)
              (make-triangle 'scalene 'obtuse 43 27 110))
(check-expect (complete-triangle 41 111)
              (make-triangle 'scalene 'obtuse 41 111 28))
(check-expect (complete-triangle 43 90)
              (make-triangle 'scalene 'right 43 90 47))
(check-expect (complete-triangle 43 47)
              (make-triangle 'scalene 'right 43 47 90))