import sys

if len(sys.argv)==3:
	weight=float(sys.argv[1])
	height=float(sys.argv[2])
	bmi=weight / (height * height)
	
	print("Your BMI is " + str(bmi))

	if bmi <= 18.5:
		print("You're underweight.")
	elif bmi <= 25:
		print("You're healthy.")
	elif bmi <= 30:
		print("You're overweight.")
	else:
		print("Holy McShizzle, you're freaking whale!")
else:
	print("Usage: "+sys.argv[0]+" <weight> <height>")
