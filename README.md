#BMI calculators in multiple programming languages
This is a minor project, where we're going to write scripts/programs in different programming languages. All the programs will do the same: Calculate BMI from height and weight.
##Formula
We're using the formula:
```
BMI=Weight / Height^2
```
##Commandline syntax
```
<command> <weight [kg]> <height [m]>
```
##Output
The program should output the exact BMI-value with two decimals using the following:
```cpp
cout << "Your BMI is: " << bmi << endl;
```
Afterwards one of the following messages should be printed:
```cpp
if(bmi <= 18.5)
{
	output="You're underweight.";
}
else if(bmi <= 25)
{
	output="You're healthy.";
}
else if(bmi <= 30)
{
	output="You're overweight.";
}
else
{
	output="Holy McShizzle, you're freaking whale!";
}
```
