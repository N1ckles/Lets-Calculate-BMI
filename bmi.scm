; trashy program #1

(define weight (string->number (car (cdr (command-line)))))
(define height (string->number (car (cdr (cdr (command-line))))))
(define bmi (/ weight (* height height)))

(cond
 [(<= bmi 18.5) (write "You're underweight.")]
 [(<= bmi 25.0) (write "You're healthy.")]
 [(<= bmi 30.0) (write "You're overweight.")]
 [else (write "Holy McShizzle, you're freaking whale!")])

(newline)
