;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09_interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; q1

  

;; q2



;; q3

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


;; ------- definitions for q4 and q5 ----------

;; a FileFormat is (anyof 'x 'y 'z)

(define-struct file (size format))
;; a File is a (make-file Nat FileFormat)
;; requires:
;;     format represents the file format (similar to .jpg or .rkt
;;       in a real computer)
;;     size represents how much space it uses on the computer

(define-struct folder (files subfolders))
;; a Folder is a (make-folder (listof File) (listof Folder))
;; requires:
;;      files represents all of the files directly in this folder
;;      subfolders represents the folders directly in this folder

     
;; q4

;; q5





