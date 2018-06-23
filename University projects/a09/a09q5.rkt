;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 09, Problem 5
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

;; (convert old new folder) produces a new folder that substitute
;;   every format in the folder that is the same as the format old
;;   into the new format without other changes.
;; convert: Folder -> Folder
;; Examples:
(check-expect (convert 'y 'y fldF) fldF)
(check-expect (convert 'x 'z fldA)
              (make-folder (list (make-file 10 'z)
                                 (make-file 25 'y)
                                 (make-file 30 'z)) empty))

(define (convert old new folders)
  (local
    [;; (change-both folder) produces a new folder by substituting the
     ;;   new format to the old format in the folder and keeps
     ;;   all other parts remaining the same during the process
     ;; change-both: Folder -> Folder
     (define (change-both folder)
       (cond
         [(empty? folder) empty]
         [else (make-folder (change-in-file (folder-files folder))
                            (change-in-sub (folder-subfolders folder)))]))
     ;; (change-in-file file) produces a new list of file that each of the old
     ;;   format has been changed to new format.
     ;; change-in-file: (listof File) -> (listof File)
     (define (change-in-file file)
       (cond
         [(empty? file) empty]
         [(equal? (file-format (first file)) old)
          (cons (make-file (file-size (first file)) new) 
                (change-in-file (rest file)))]
         [else (cons (first file) (change-in-file (rest file)))]))
     ;; (change-in-sub subfolders) produces a list of subfolders that all
     ;;   the old formats in it are changed into new format.
     ;; change-in-sub: (listof Folder) -> (listof Folder)
     (define (change-in-sub subfolders)
       (cond
         [(empty? subfolders) empty]
         [else (cons (change-both (first subfolders))
                     (change-in-sub (rest subfolders)))]))]
    (change-both folders)))

;; Tests: 
(check-expect (convert 'y 'z empty) empty)
(check-expect (convert 'x 'z fldA)
              (make-folder (list (make-file 10 'z)
                                 (make-file 25 'y) (make-file 30 'z)) empty))
(check-expect (convert 'x 'y fldA)
              (make-folder (list (make-file 10 'y) f25y f30z) empty))
(check-expect (convert 'x 'z fldB)
              (make-folder (list (make-file 25 'z) (make-file 30 'z)) empty))

