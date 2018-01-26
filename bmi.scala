object bmi {
  def main(args: Array[String]): Unit = {
    if (args.length != 2) {
      println("Usage: <command> <weight [kg]> <height [m]>")
      return
    }
    try {
      val Array(weight, height) = args.map(_.toDouble)
      val bmi = weight / math.pow(height, 2.0)

      printf("Your BMI is: %.2f\n", bmi)

      bmi match {
        case x if x <= 18.5 => println("You're underweight.")
        case x if x <= 25.0 => println("You're healthy.")
        case x if x <= 30.0 => println("You're overweight.")
        case _ => println("Holy McShizzle, you're freaking whale!")
      }
    } catch {
      case _: NumberFormatException => println("Arguments must be numbers.")
    }
  }
}
