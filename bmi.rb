if ARGV.length != 2
  puts "Usage: bmi.rb <weight [kg]> <height [m]>"
  exit 1
end

inWeight, inHeight, *rest = ARGV

weight = inWeight.to_f
height = inHeight.to_f

bmi = weight / height ** 2

puts "Your BMI is " + bmi.to_s

if bmi <= 18.5
    puts "You're underweight."
elsif bmi <= 25
    puts "You're healthy."
elsif bmi <= 30
    puts "You're overweight."
else
    puts "Holy McShizzle, you're freaking whale!"
end
