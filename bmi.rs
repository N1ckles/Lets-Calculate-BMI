use std::env;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    let args: Vec<_> = env::args().collect();
    if args.len() != 3 {
        println!("Usage: {} <weight [kg]> <height [m]>", args[0]);
        return Ok(());
    }

    let weight = args[1].parse::<f64>()?;
    let height = args[2].parse::<f64>()?;
    let bmi = weight / height.powi(2);
    println!("Your BMI is: {}", bmi);

    println!("{}", match bmi {
        bmi if bmi <= 18.5 => "You're underweight.",
        bmi if bmi <= 25.0 => "You're healthy.",
        bmi if bmi <= 30.0 => "You're overweight.",
        _ => "Holy McShizzle, you're freaking whale!"
    });

    Ok(())
}
