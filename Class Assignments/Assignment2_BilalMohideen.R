#Assignment 2 - Narcissistic Numbers
#Bilal Mohideen - BTC1855H

#Prompt the user to enter a three digit positive number

answer <- readline(prompt = "Please enter a three digit positive number: ")

#Converting "answer" from character data into numeric form
#Separate number into individual digits with "strsplit" function
#After cubing each of the digits, the sum of of the cubes is calculated

digits <- as.numeric(strsplit(as.character(answer),"")[[1]])

digits_cubed <- (digits^3)

digits_sum <- (sum(digits_cubed))

answer <- as.numeric(answer)

#Checking if the number is valid (three digits, positive)

if (is.na(answer)){
  print("Error: Entry is not a number.")
} else if (answer < 0){
  print("Error: Entry is a negative number.")
} else if (nchar(as.character(answer)) < 3){
  print("Error: Entry is less than three digits.")
} else if (digits_sum == answer){
  print(paste(answer,"is an Armstrong number."))
} else if (digits_sum != answer){
  print(paste(answer,"is not an Armstrong number."))
}



