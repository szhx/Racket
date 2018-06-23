;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 09, Problem 4
;;***************************************************
;;

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

;; define contants for tests
(define f10x (make-file 10 'x))
(define f25y (make-file 25 'y))
(define f30x (make-file 30 'x))
(define f25x (make-file 25 'x))
(define f10y (make-file 10 'y))
(define f10z (make-file 10 'z))
(define f30x-copy (make-file 30 'x))
(define f10z-copy (make-file 10 'z))
(define f50y (make-file 50 'y))
(define f30z (make-file 30 'z))
(define f0x (make-file 0 'x))
(define f50z (make-file 50 'z))
(define fldA (make-folder (list f10x f25y f30z) empty))
(define fldB (make-folder (list f25x f30x-copy) empty))
(define fldC (make-folder (list f10z f10y f50y) empty))
(define fldD (make-folder (list f10z-copy f30x) (list fldA)))
(define fldE (make-folder empty (list fldB fldC)))
(define fldF (make-folder (list f0x f50z) (list fldD fldE)))

;; (total-size fld fmt deep-check?) produces the sum of sizes of the selected
;;   files following these rules:
;;   If fmt is 'all then consider all formats of files otherwise just consider
;;   files with the specific format given by fmt. If deep-check? is true then
;;   consider all files in the subfolders otherwise just consider files
;;   directly in fld.
;; total-size: Folder (anyof FileFormat 'all) Bool -> Nat
;; Examples:
(check-expect (total-size fldE 'all true) 125)
(check-expect (total-size fldF 'z false) 50)

(define (total-size fld fmt deep-check?)
  (local
    [;;(sum-of-size fld) produces the sum of sizes of selected files in the
     ;;given folder according to the given fmt and deep-check?
     ;;sum-of-size: Folder -> Nat
     (define (sum-of-size fld)
       (cond
         [(and (equal? fmt 'all) (equal? deep-check? true))
          (+ (files-sum (folder-files fld))
             (subfolders-sum (folder-subfolders fld)))]
         [(and (not (equal? fmt 'all)) (equal? deep-check? true))
          (+ (sum-for-same (folder-files fld))
             (subfolders-sum (folder-subfolders fld)))]
         [(and (equal? fmt 'all) (equal? deep-check? false))
          (files-sum (folder-files fld))]
         [(and (not (equal? fmt 'all)) (equal? deep-check? false))
          (sum-for-same (folder-files fld))]))
     ;;(subfolders-sum sub) produces the sum of sizes of selected files
     ;;in the given list of folder according to the given fmt and deep-check?
     ;;folders-sum: (listof Folder) -> Nat
     (define (subfolders-sum sub)
       (cond
         [(empty? sub) 0]
         [else (+ (sum-of-size (first sub))
                  (subfolders-sum (rest sub)))]))
     ;; (files-sum files) produces the sum of sizes of selected files
     ;;   in the given list of file without format requirements
     ;;   files-sum: (listof File) -> Nat 
     (define (files-sum file)
       (cond
         [(empty? file) 0]
         [else (+ (file-size (first file)) (files-sum (rest file)))]))
     ;; (same-format-files-sum files) produces the sum of sizes of selected files
     ;;   in the given list of file with special format requirements
     ;;   files-sum: (listof File) -> Nat
     (define (sum-for-same files)
       (cond
         [(empty? files) 0]
         [(equal? fmt (file-format (first files)))
          (+ (file-size (first files)) (sum-for-same (rest files)))]
         [else (sum-for-same (rest files))]))] 
    (sum-of-size fld)))

;; Tests:
(check-expect (total-size fldB 'x false) 55)
(check-expect (total-size fldF 'z true) 100)
(check-expect (total-size (make-folder empty empty) 'all true) 0)
(check-expect (total-size fldB 'x false) 55)
(check-expect (total-size fldE 'all false) 0)
(check-expect (total-size fldA 'all true) 65)
(check-expect (total-size fldB 'z false) 0)