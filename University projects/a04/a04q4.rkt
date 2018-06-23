;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 04, Problem 4
;;***************************************************
;;

;; A Book-Price is (anyof Num false), where it is a number >= 0 if the 
;;   book is available in the associated format, and false otherwise.

(define-struct book-purchase (hardcover softcover ebook))
;; A Book-Purchase is a 
;;   (make-book-purchase Book-Price Book-Price Book-Price)
;; Requires:
;;   hardcover, softcover, and ebook, are the prices of the book if it
;;     is available in the respective formats, and false otherwise.

;; Template for Book-Purchase function
;; my-book-purchase-fun: Book-Purchase -> Any
(define (my-book-purchase-fun abook)
  (... (book-purchase-hardcover abook) ...
       (book-purchase-softcover abook) ...
       (book-purchase-ebook abook) ...))

(define-struct textbook (title online purchase))
;; A Textbook is a (make-textbook Str Str Book-Purchase), 
;; Requires:
;;   title is nonempty.
;;   online is the empty string if the textbook is not available 
;;     online; otherwise, it is the URL for the online text.
;;   purchase provides the prices for the book in hardcover, 
;;     softcover, and ebook format (if they are available).

;; Template for Textbook function
;; my-textbook-fun: Textbook -> Any
(define (my-textbook-fun atextbook)
  (... (textbook-title atextbook) ...
       (textbook-online atextbook) ...
       (textbook-purchase atextbook) ...))

;; (hard text1) produces the price of the book in hardcover in
;;   a textbook structure.
;; hard: Textbook -> Num
;; Example:
(check-expect (hard (make-textbook "How to Design Programs" "" (make-book-purchase 50 43 25))) 50)

(define (hard text1)
  (book-purchase-hardcover (textbook-purchase text1)))

;; (soft text1) produces the price of textbook in softcover in
;;   a textbook structure.
;; hard: Textbook -> Num
;; Example:
(check-expect (soft (make-textbook "How to Design Programs" "" (make-book-purchase 50 32 25))) 32)

(define (soft text2)
  (book-purchase-softcover (textbook-purchase text2)))

;; (eb text1) produces the price of the book in ebook in
;;   a textbook structure.
;; eb: Textbook -> Num
;; Example:
(check-expect (eb (make-textbook "How to Design Programs" "" (make-book-purchase 50 43 30))) 30)

(define (eb text3)
  (book-purchase-ebook (textbook-purchase text3)))

;; (cheapest-method text) produces the cheapest method to buy the available types
;;   of textook where the hardcover price has a 50% discount and softcover price
;;   has a 30% discount and no discount for online version and ebook version.
;; cheapest-method: Textbook -> Any
;; Requires:
;;   if the all the prices after discount are equal, we have online at first,
;;   then ebook, then softcover, then hardcover
;;   the online version is always the most preferred if exist
;; Example:
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase 86.40 false 75.42))) 'online)

(define (cheapest-method text)
  (cond
    [(= (string-length (textbook-online text)) 0) 
     (cond
       [(and (equal? (hard text) false)
             (equal? (soft text) false))
        'ebook]
       [(and (equal? (hard text) false)
             (equal? (eb text) false))
        'softcover]
       [(and (equal? (eb text) false)
             (equal? (soft text) false))
        'hardcover]
       [(equal? (hard text) false)
        (cond
          [(< (* 0.7 (soft text)) (eb text))
           'softcover]
          [(< (eb text) (* 0.7 (soft text)))
           'ebook]
          [(= (eb text) (* 0.7 (soft text)))
           'ebook])]
       [(equal? (soft text) false)
        (cond
          [(< (* 0.5 (hard text)) (eb text))
           'hardcover]
          [(< (eb text) (* 0.5 (hard text)))
           'ebook]
          [(= (eb text) (* 0.5 (hard text)))
           'ebook])]
       [(equal? (eb text) false)
        (cond
          [(< (* 0.5 (hard text)) (* 0.7 (soft text)))
           'hardcover]
          [(< (* 0.7 (soft text)) (* 0.5 (hard text)))
           'softcover]
          [(= (* 0.7 (soft text)) (* 0.5 (hard text)))
           'softcover])]
       [else
        (cond
          [(= (min (* 0.7 (soft text)) (* 0.5 (hard text)) (eb text))
              (eb text)) 'ebook]
          [(= (min (* 0.7 (soft text)) (* 0.5 (hard text)) (eb text))
              (* 0.7 (soft text))) 'softcover]
          [(= (min (* 0.7 (soft text)) (* 0.5 (hard text)) (eb text))
              (* 0.5 (hard text))) 'hardcover])])]
    [else 'online]))

(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase 86.40 25.4 75.42))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase false 24 75.42))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase 86.40 78 false))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase false false 75.42))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase 86.40 false false))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "http://www.htdp.org/"
                                              (make-book-purchase false 75.42 false))) 'online)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 43 25))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 43 50))) 'hardcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 14 50))) 'softcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase false false 25))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 false false))) 'hardcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase false 43 false))) 'softcover) 
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 43 false))) 'hardcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 false 25))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase false 43 25))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase false 43 50))) 'softcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 50 false 50))) 'hardcover) 
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 69 43 false))) 'softcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 70 50 35))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 70 50 false))) 'softcover)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase 70 false 35))) 'ebook)
(check-expect (cheapest-method (make-textbook "How to Design Programs" "" (make-book-purchase false 50 35))) 'ebook)



