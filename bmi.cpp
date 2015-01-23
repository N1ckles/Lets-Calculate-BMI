#include <iostream>
#include <stdlib.h>

using namespace std;

int main(int argc, char* argv[]){
	if(argc!=3){
		cout<<"Usage: "<<argv[0]<<" <weight> <height>"<<endl;
	}else{
		double height=atof(argv[2]);
		double weight=atof(argv[1]);
		double bmi=weight / (height * height);

		cout<<"Your BMI is: "<<bmi<<endl;
		if(bmi <= 18.5)
		{
			cout<<"You're underweight."<<endl;
		}
		else if(bmi <= 25)
		{
			cout<<"You're healthy."<<endl;
		}
		else if(bmi <= 30)
		{
			cout<<"You're overweight."<<endl;
		}
		else
		{
			cout<<"Holy McShizzle, you're freaking whale!"<<endl;
		}
	}
	return 0;
}
