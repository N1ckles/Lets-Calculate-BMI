#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
	if (argc != 3) {
		printf("Usage: %s weight[Kg] height[cm]\n", argv[0]);
		exit(EXIT_SUCCESS);
	}

	double w, h;
	w = atof(argv[1]);
	h = atof(argv[2]) / 100;

	double bmi = (w / (h * h));
	
	if (bmi <= 18.5) 
		printf("You're underweight.\n");
	else if (bmi <= 25.0)
		printf("You're healthy.\n");
	else if (bmi <= 30.0)
		printf("You're overweight.\n");
	else
		printf("Holy McShizzle, you're freaking whale!\n");


	printf("Your BMI was: %.3f\n", bmi);
	return 0;
}
