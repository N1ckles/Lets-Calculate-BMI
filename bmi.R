Fbmi <- function(myW, myH){
	return(myW/(myH*myH))
}

w <- readline(prompt="Please enter you weight in KG ")
h <- readline(prompt="Please enter you height in M ")

bmi <- Fbmi(as.numeric(w), as.numeric(h))

if(bmi <= 18.5){
	print("You're underweight.")
} else if(bmi <= 25){
	print("You're healthy.")
} else if(bmi <= 30){
	print("You're overweight.")
} else{
	print("Holy McShizzle, you're freaking whale!")
}
