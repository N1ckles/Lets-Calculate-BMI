use std::io;

fn main() {
    println!("Usage: <command> <weight [kg]> <heigth [m]>");

    let mut w = String::new();
    
    io::stdin()
        .read_line(&mut w)
        .expect("");
    
    let w: f32 = w.trim().parse().unwrap();


    let mut h = String::new();
    io::stdin()
        .read_line(&mut h)
        .expect("");

    let h: f32 = h.trim().parse().unwrap();
    let bmi = w / (h * h);

    if bmi <= 18.5{
        println!("You're underweight.\n");
    }

    else if bmi <= 25.0{
        println!("You're healthy.\n");
    }

    else if bmi <= 30.0{
        println!("You're overweight.\n");
    }

    else{
        println!("Holy McShizzle, you're freaking whale!\n");
    }
    
    println!("Your BMI was {}", bmi);
}
