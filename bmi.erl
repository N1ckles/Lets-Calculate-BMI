#!/usr/bin/env escript

main([WeightStr, HeightStr]) ->
	{Weight, _} = string:to_integer(WeightStr),
	{Height, _} = string:to_integer(HeightStr),
	{Bmi,Msg} = calculate_bmi(Weight, Height),
	io:format("Your BMI is: ~.2f~n", [Bmi]),
	io:format("~s~n", [Msg]).

calculate_bmi(W, H) ->
	Bmi = W / (H*H),
	Msg = if
		Bmi =< 18.5 ->
			"You're underweight.";
		Bmi =< 25.0 ->
			"You're healthy.";
		Bmi =< 30.0 ->
			"You're overweight.";
		Bmi > 30.0 ->
			"Holy McShizzle, you're freaking whale!"
		end,
	{Bmi, Msg}.