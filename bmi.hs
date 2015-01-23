main = do
	putStrLn "Enter your weight in kg: "
	weight <- getLine
	putStrLn "Enter your height in meters: "
	height <- getLine

	putStrLn (bmiCalc (read weight) (read height))

bmiCalc :: (RealFloat a) => a -> a -> String  
bmiCalc w h 
    | w / h ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | w / h ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | w / h ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise         = "You're a whale, congratulations!" 
