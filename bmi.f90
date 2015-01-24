program bmi

        real   :: w, h, bmi_value

        write(*,*) 'Enter your weight in kg: '
        read (*,*) w
   
        write(*,*) 'Enter your height in meters: '
        read (*,*) h
        
        bmi_value = w / (h*h)
        
        write(*,*) "Your BMI is:", bmi_value 
        
        if (bmi_value <= 18.5) then
                write(*,*) "You're underweight."
        else if (bmi_value <= 25.0) then
                write(*,*) "You're healthy."
        else if (bmi_value <= 30.0) then
                write(*,*) "You're overweight."
        else
                write(*,*) "Holy McShizzle, you're freaking whale!"
        end if

end program bmi
