;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Lab 03, Problem 6
;;***************************************************
;;

(define (film-choice
         num-clips length
         breakpoint1 discount1
         breakpoint2 discount2)
  (string-append "Cost for option 1 is "
                 (number->string (- (+ (* 100 length) (* 100 num-clips))
                    (* discount1 (- num-clips breakpoint1) 100
                       (+ (sgn (- (sgn (- num-clips breakpoint1)) 1)) 1))))
                 " and cost for option 2 is "
                 (number->string (- (+ (* 100 length) (* 100 num-clips))
                    (* discount2 (- num-clips breakpoint2) 100
                       (+ (sgn (- (sgn (- num-clips breakpoint2)) 1)) 1))))))

  
