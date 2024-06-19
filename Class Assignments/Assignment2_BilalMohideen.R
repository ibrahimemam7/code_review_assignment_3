#Assignment 2 - Narcissistic Numbers
#Bilal Mohideen - BTC1855H

#Prompt the user to enter a three digit positive number

answer <- readline(prompt = "Please enter a three digit positive number: ")

#Converting "answer" from character data into numeric form
#Separate number into individual digits with "strsplit" function
#After cubing each of the digits, the sum of of the cubes is calculated

digits <- as.numeric(strsplit((answer),"")[[1]])

digits_cubed <- (digits^3)

digits_sum <- (sum(digits_cubed))

#Checking if the number is valid (three digits, positive)

if (is.na(answer)){
  print("Error: Entry is not a number.")
} else if (answer < 0){
  print("Error: Entry is a negative number.")
} else if (length(answer) < 3){
  print("Error: Entry is less than three digits.")
} 
