;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 01, Problem 3
;;***************************************************
;;

(define (deg->rad deg)
  (* (/ pi 180) deg))

(define R 6371)

(define (geo-distance lat1 long1 lat2 long2)
  (* (deg->rad (acos (+ (* (sin lat1) (sin lat2))
              (* (cos lat1) (cos lat2)
                 (cos (- long1 long2)))))) R))