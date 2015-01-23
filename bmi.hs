main = do
	putStrLn "Enter your weight in kg: "
	weight <- getLine
	putStrLn "Enter your height in meters: "
	height <- getLine

	putStrLn (bmiCalc (read weight) (read height))
	putStrLn ("Your BMI is: " ++ (show ((read weight) / ((read height)^2))))
bmiCalc :: (RealFloat a) => a -> a -> String  
bmiCalc w h 
    | w / h ^ 2 <= 18.5 = "You're underweight."
    | w / h ^ 2 <= 25.0 = "You're healthy."
    | w / h ^ 2 <= 30.0 = "You're overweight."
    | otherwise         = "Holy McShizzle, you're freaking whale!"
