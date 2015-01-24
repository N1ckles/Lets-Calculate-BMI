#!/bin/bash

clear

echo "Enter your weight in kg: "
read weight
echo "Enter your height in meters: "
read height

bmi=$(awk -v weight=$weight -v height=$height \
	'BEGIN {print (weight/(height*height))}')


echo "Your BMI is: $bmi"

underweight=$(echo "$bmi<=18.5" | bc)
normal=$(echo "$bmi<=25" | bc)
overweight=$(echo "$bmi<=30" | bc)

if [ $underweight -eq 1 ]
then 
	echo "You're underweight."
elif [ $normal -eq 1 ]
then 
	echo "You're healthy."
elif [ $overweight -eq 1 ]
then 
	echo "You're overweight."
else	
	echo "Holy McShizzle, you're freaking whale!"
fi


