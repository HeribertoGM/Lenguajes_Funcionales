#lang racket

;; 1. suma de listas
(define (sumList lst)
  (if (null? lst)
   0
   (if (number? (car lst))
       (+ (car lst) (sumList (cdr lst)))
       (+ 0 (sumList (cdr lst)))
   )
  )
)

(display (sumList '(1 2 a 1 d 3 4)))
(display "\n")

;; 3. reversa de una lista
(define (reversa lst)
  (if (null? lst)
      '()
      (append (reversa (cdr lst)) (list(car lst)))
  )
)

(display (reversa '(1 2 3 4)))
(display "\n")

;; 2. checa si es palindromo
(define (palindrome lst)
  (equal? lst (reversa lst))
)

(display (palindrome '(1 2 3 2 1)))
(display "\n")

;; 4. Accesa elementos de una lista por index
(define (indice lst i)
  (if (equal? i 0)
      (car lst)
      (indice (cdr lst) (- i 1))
  )
)

(display (indice '(1 2 3 4 5 7 6) 5))
(display "\n")

;; 5. lista generada de elementos en poscisiones impar
(define (oddList lst)
  (if (null? lst)
      '()
      (if (> (length lst) 1)
          (cons (cadr lst) (oddList (cddr lst)))
          '()
      )
  )
)

(display (oddList '(1 2 3 4 5 7 6)))
(display "\n")