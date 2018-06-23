;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 09, Problem 3
;;***************************************************
;;

;; an RGBPixel is a (list Nat Nat Nat)
;; requires: 0 <= first <= 255, repr the red content of the pixel
;;           0 <= second <= 255, repr the green content of the pixel
;;           0 <= third <= 255, repr the blue content of the pixel



(define-struct pixeledit (type rdelta gdelta bdelta))
;; a PixelEdit is a (make-pixeledit (anyof 'scale 'shift) Num Num Num)
;; requires: if type is 'shift then:
;;             -255 <= rdelta, gdelta, bdelta <= 255, and are integers
;;           if type is 'scale then:
;;             rdelta, gdelta bdelta > 0

(define start-pix (list 0 0 0))
(define start-pix2 (list 1 1 1))
(define ed1 (make-pixeledit 'shift 10 10 10))
(define ed2 (make-pixeledit 'scale 2 1 3))
(define ed3 (make-pixeledit 'shift -10 -10 -10))
(define ed4 (make-pixeledit 'scale 0.5 1.25 1.58))
(define ed5 (make-pixeledit 'shift 0.5 0.9 1.3))
(define ed6 (make-pixeledit 'scale 10 10 10))

;; (make-edits rgb list) produces a new RGBPixel after shifting or scaling
;;   according to the list of PixelEdit on the original RGB list, the edition
;;   should be done according to the reverse order of the list of PixelEdit.
;; make-edits: RGBPixel (listof PixelEdit) -> RGBPixel
;; Examples:
(check-expect (make-edits start-pix empty) start-pix)
(check-expect (make-edits start-pix (list ed1)) (list 10 10 10))

(define (make-edits rgb list)
  (local
    [;; (change-rdelta red rest-result) produces the next new redelta value
     ;;   after shifting or scaling and round to near integer by consuming
     ;;   a starting PixelEdit (red) and the rest results.
     ;; change-redelta: PixelEdit RGBPixel -> Nat
     (define (change-rdelta red rest-result)
       (cond
         [(equal? (pixeledit-type red) 'scale)
          (max 0 (min 255 (floor (* (pixeledit-rdelta red)
                                    rest-result))))]
         [else
          (max 0 (min 255 (floor (+ (pixeledit-rdelta red)
                                    rest-result))))]))
     ;; (final-red list) produces the final result after all the shifting
     ;;   or scaling have been done for the red content.
     ;; final-red: (listof PixelEdit) -> Nat
     (define (final-red list)
       (foldr change-rdelta (first rgb) list))
     ;; (change-gdelta green rest-result) produces the next new redelta value
     ;;   after shifting or scaling and round to near integer by consuming
     ;;   a starting PixelEdit (green) and the rest results.
     ;; change-redelta: PixelEdit RGBPixel -> Nat
     (define (change-gdelta green rest-result)
       (cond
         [(equal? (pixeledit-type green) 'scale)
          (max 0 (min 255 (floor (* (pixeledit-gdelta green)
                                    rest-result))))]
         [else
          (max 0 (min 255 (floor (+ (pixeledit-gdelta green)
                                    rest-result))))]))
     ;; (final-green list) produces the final result after all the shifting
     ;;   or scaling have been done for the red content.
     ;; final-green: (listof PixelEdit) -> Nat
     (define (final-green list)
       (foldr change-gdelta (first rgb) list))
    ;; (change-bdelta blue rest-result) produces the next new redelta value
     ;;   after shifting or scaling and round to near integer by consuming
     ;;   a starting PixelEdit (blue) and the rest results.
     ;; change-redelta: PixelEdit RGBPixel -> Nat
     (define (change-bdelta blue rest-result)
       (cond
         [(equal? (pixeledit-type blue) 'scale)
          (max 0 (min 255 (floor (* (pixeledit-bdelta blue)
                                    rest-result))))]
         [else
          (max 0 (min 255 (floor (+ (pixeledit-bdelta blue)
                                    rest-result))))]))
     ;; (final-blue list) produces the final result after all the shifting
     ;;   or scaling have been done for the red content.
     ;; final-green: (listof PixelEdit) -> Nat
     (define (final-blue list)
       (foldr change-bdelta (first rgb) list))]
    (cons (final-red list) (cons (final-green list)
                                 (cons (final-blue list) empty)))))

;;Tests:
(check-expect (make-edits start-pix (list ed5)) (list 0 0 1))
(check-expect (make-edits start-pix2 (list ed2)) (list 2 1 3))
(check-expect (make-edits start-pix2 (list ed4)) (list 0 1 1))
(check-expect (make-edits start-pix (list ed3 ed2 ed1)) (list 10 0 20))
(check-expect (make-edits start-pix2 (list ed6 ed6 ed6)) (list 255 255 255))
(check-expect (make-edits start-pix (list ed4 ed4 ed1)) (list 2 15 23))
(check-expect (make-edits start-pix (list ed1)) (list 10 10 10))
(check-expect (make-edits start-pix (list ed4)) (list 0 0 0))

    