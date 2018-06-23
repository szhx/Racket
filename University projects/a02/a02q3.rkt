;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 02, Problem 1
;;***************************************************
;;

;; (overwrite s beg end) produces a string
;;   which the beg substitutes the first few
;;   terms of s with its full string-length
;;   and end substitutes last few terms of with its
;;   full string-length and if they the string-length
;;   of beg or end is longer than that of s, then we just
;;   combine beg's tail with end's head
;; overwrite: Str Str -> Str

;; Examples:
(check-expect (overwrite "catapult" "magic" "hat")
              "magichat")
                          
(define (overwrite s beg end)
  (string-append beg
                 (substring
                  s (min (string-length beg)
                          (string-length s))
                  (min (+ (string-length beg)
                          (max (- (string-length s)
                                  (string-length beg)
                                  (string-length end)) 0))
                       (+ (string-length s)
                          (max (- (string-length s)
                                  (string-length beg)
                                  (string-length end)) 0))))
                 end))

;;Tests:
(check-expect (overwrite "catapult" "a" "b") "aatapulb")
(check-expect (overwrite "catapult" "gogo" "gadget")
              "gogogadget")
(check-expect (overwrite "catapult" "free for all" "!!!")
              "free for all!!!")
(check-expect (overwrite "catapult" "x" "electricity")
              "xelectricity")
                 