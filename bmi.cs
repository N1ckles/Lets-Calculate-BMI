using System;

namespace BMI
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("Usage: bmi <weight [kg]> <height [m]>", args[0]);
                Environment.Exit(1);
            }

            double weight = Double.Parse(args[0]);
            double height = Double.Parse(args[1]);

            double bmi = weight / Math.Pow(height, 2);

            Console.WriteLine("Your BMI is: {0}", bmi);

            if (bmi <= 18.5)
            {
                Console.WriteLine("You're underweight.");
            }
            else if (bmi <= 25)
            {
                Console.WriteLine("You're healthy.");
            }
            else if (bmi <= 30)
            {
                Console.WriteLine("You're overweight.");
            }
            else
            {
                Console.WriteLine("Holy McShizzle, you're freaking whale!");
            }
        }
    }
}
