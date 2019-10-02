;; Exp. (merge '(10 30 50 70 80 90 100) '(20 40 60)) ==> (10 20 30 40 50 60 70 80 90 100)
(define (merge L M)
	(if (null? L) M
		(if (null? M) L
			(if (< (car L) (car M))
				(cons (car L) (merge (cdr L) M))
				(cons (car M) (merge (cdr M) L))))))

;; split helper functions
(define (odd L)
	(if (null? L) '()
		(if (null? (cdr L)) (list (car L))
			(cons (car L) (odd (cddr L))))))
(define (even L)
	(if (null? L) '()
		(if (null? (cdr L)) '()
			(cons (cadr L) (even (cddr L))))))

;; Exp. (split '(a b c d e f g h i)) ==> ((a c e g i)(b d f h))
(define (split L)
	(cons (odd L) (cons (even L) `())))

;; Exp. (mergesort '(8 1 3 9 6 5 7 2 4 10)) ==> (1 2 3 4 5 6 7 8 9 10)
(define (mergesort L)
	(if (null? L) L
		(if (null? (cdr L)) L
			(merge
				(mergesort (car (split L)))
				(mergesort (cadr (split L)))))))
