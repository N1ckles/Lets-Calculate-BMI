public class bmi {	
	public static void main(String[] args){
		if(args.length!=2)
		{
			System.out.println("Usage: <command> <weight [kg]> <height [m]>");
			return;
		}
		else
		{
			try
			{
				double weight = Double.parseDouble(args[0]);
				double height = Double.parseDouble(args[1]);
				double bmi = weight / (height * height);
				System.out.println("Your BMI is:\t"+bmi);
				String output;
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
				System.out.println(output);
			}
			catch(NumberFormatException e)
			{
				System.out.println("Commandline arguments must be pure numerical!");
			}
		}
	}
}
