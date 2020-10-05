#!/usr/bin/env swipl

:- initialization(main, main).

main([W,H]) :-
	atom_number(W, Weight),
	atom_number(H, Height),
	bmi(Weight,Height,Bmi),
	msg(Bmi,Msg),
	format('Your BMI is: ~2f~n~s~n', [Bmi,Msg]).
main(_Args) :- format('no.~n').

bmi(W,H,Bmi) :- Bmi is W/(H*H).

msg(Bmi, "You're underweight.") :- Bmi =< 18.5.
msg(Bmi, "You're healthy.") :- 18.5 < Bmi, Bmi =< 25.0.
msg(Bmi, "You're overweight.") :- 25.0 < Bmi, Bmi =< 30.0.
msg(Bmi, "Holy McShizzle, you're freaking whale!") :- 30 < Bmi.
