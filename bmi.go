package main

import "os"
import "fmt"
import "strconv"

func main() {
	if len(os.Args) != 3 {
		fmt.Printf("Usage: %s <weight [kg]> <height [m]>\n", os.Args[0])
		os.Exit(0)
	}
	weight, _ := strconv.ParseFloat(os.Args[1], 64)
	height, _ := strconv.ParseFloat(os.Args[2], 64)
	bmi := weight / (height * height);

	fmt.Println("Your BMI is: ", bmi);

	if bmi <= 18.5 {
		fmt.Println("You're underweight.")
	} else if bmi <= 25.0 {
		fmt.Println("You're healthy.")
	} else if bmi <= 30.0 {
		fmt.Println("You're overweight.")
	} else {
		fmt.Println("Holy McSizzle, you're freaking whale!")
	}
}
