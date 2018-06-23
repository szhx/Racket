;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CS115 Fall 2017
;; Assignment 01

;; Question 1

(define acce1 9.8)
(define (time-to-ground v h)
  (/ (- v (sqrt
           (- (sqr v)
              (* 4 h (/ (- 0 acce1) 2)))))
     (* 2 (/ (- 0 acce1) 2))))

;; Question 2

(define phi (/ (+ 1 (sqrt 5)) 2)) 
(define (fibonacci-num n)
  (/ (- (expt phi n)
        (expt (/ 1 (- 0 phi)) n))
     (sqrt 5)))

;; Question 3
(define (deg->rad deg)
  (* (/ pi 180) deg))

(define R 6371)
(define (geo-distance lat1 long1 lat2 long2)
  (* (/ pi 180) (* (acos (+ (* (sin lat1) (sin lat2))
              (* (cos lat1) (cos lat2)
                 (cos (- long1 long2)))))) R))