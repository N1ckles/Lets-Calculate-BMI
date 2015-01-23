var weight=parseFloat(prompt("Enter weight:"));
var height=parseFloat(prompt("Enter height:"));
var bmi=weight / (height * height);

alert("Your BMI is: "+bmi);

if(bmi <= 18.5)
{
	alert("You're underweight.");
}
else if(bmi <= 25)
{
	alert("You're healthy.");
}
else if(bmi <= 30)
{
	alert("You're overweight.");
}
else
{
	alert("Holy McShizzle, you're freaking whale!");
}
