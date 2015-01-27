print "Weight in kg: ";
$weight = <STDIN>;
print "Height in meters: ";
$height = <STDIN>;

$bmi = $weight / $height ** 2;
print "Your BMI is: ".$bmi."\n";

if($bmi <= 18.5)
{
    $output="You're underweight.";
}
elsif($bmi <= 25)
{
    $output="You're healthy.";
}
elsif($bmi <= 30)
{
    $output="You're overweight.";
}
else
{
    $output="Holy McShizzle, you're freaking whale!";
}

print $output . "\n";
