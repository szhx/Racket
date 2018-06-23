;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;;***************************************************
;;  Hengxu Zhu (20709599)
;;  CS115 Fall 2017
;;  Assignment 04, Problem 1
;;***************************************************
;;

(define-struct particle (type energy))
;; A Particle is a (make-particle Sym Num)
;; Requires:
;;   particle types are 'photon, 'electron, or 'positron
;;   particle energy is positive

;; Template for Particle
;; my-particle-fun: Particle -> Any
(define (my-particle-fun particle)
  (... (particle-type particle) ...
       (particle-energy particle) ...))

;; (collide p1 p2) produces the type of the particle
;;   after p1 and p2 interact and the energy of the resulting
;;   particle which is the sum of the energy of the previous
;;   2 particles.
;; collide: Particle Particle -> Particle
;; Requires:
;;   the interaction only happens between 2 particles
;;   in different types.
;; Example:
(check-expect (collide (make-particle 'photon 2.5)
                       (make-particle 'electron 3.5))
              (make-particle 'electron 6))

(define (collide p1 p2)
  (cond
    [(and (symbol=? (particle-type p1) 'photon)
          (symbol=? (particle-type p2) 'electron))
     (make-particle 'electron
                    (+ (particle-energy p1)
                       (particle-energy p2)))]
    [(and (symbol=? (particle-type p2) 'photon)
          (symbol=? (particle-type p1) 'electron))
     (make-particle 'electron
                    (+ (particle-energy p1)
                       (particle-energy p2)))]
    [(and (symbol=? (particle-type p1) 'photon)
          (symbol=? (particle-type p2) 'positron))
     (make-particle 'positron
                    (+ (particle-energy p1)
                       (particle-energy p2)))]
    [(and (symbol=? (particle-type p2) 'photon)
          (symbol=? (particle-type p1) 'positron))
     (make-particle 'positron
                    (+ (particle-energy p1)
                       (particle-energy p2)))]
    [(and (symbol=? (particle-type p1) 'positron)
          (symbol=? (particle-type p2) 'electron))
     (make-particle 'photon
                    (+ (particle-energy p1)
                       (particle-energy p2)))]
    [(and (symbol=? (particle-type p2) 'positron)
          (symbol=? (particle-type p1) 'electron))
     (make-particle 'photon
                    (+ (particle-energy p1)
                       (particle-energy p2)))]))

;; Tests：
(check-expect (collide (make-particle 'electron 3)
                       (make-particle 'photon 4))
              (make-particle 'electron 7))
(check-expect (collide (make-particle 'photon 5.6)
                       (make-particle 'positron 3.2))
              (make-particle 'positron 8.8))
(check-expect (collide (make-particle 'positron 15)
                       (make-particle 'photon 4.8))
              (make-particle 'positron 19.8))
(check-expect (collide (make-particle 'positron 12.4)
                       (make-particle 'electron 15.1))
              (make-particle 'photon 27.5))
(check-expect (collide (make-particle 'electron 8.2)
                       (make-particle 'positron 6.7))
              (make-particle 'photon 14.9))
