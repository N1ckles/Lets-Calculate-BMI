# Let's Calculate BMI
This project contains BMI calculators written in many different programming languages.

## Calculation
We've chosen to calculate BMI the following way:
```
BMI=Weight / Height^2
```
All numbers are **floating-point** numbers.

## Input
The command-line should be favored for accepting input.
If that is not possible, then STDIN can be used.

**Note:** Weight should be in kilograms and height should be in meters.
### Commandline
The following syntax should be used for commandline:
```
<command> <weight [kg]> <height [m]>
```

### STDIN
Questions should be asked in the following order:

```Enter weight [kg]:```

```Enter height [kg]:```

Answers should be filled in on either the same line or right below.

## Output
The program should output the exact BMI-value with two decimals using the following pattern:
```
Your BMI is: <bmi>
```
Afterwards one of the following messages should be printed on the next line:

|Condition|Response|
|---------|-------|
|`BMI <= 18.5`|`You're underweight.`|
|`18.5 < BMI <= 25.0`|`You're healthy.`|
|`25.0 < BMI <= 30.0`|`You're overweight.`|
|`30.0 < BMI`|`Holy McShizzle, you're freaking whale!`|

A possible implementation:
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
