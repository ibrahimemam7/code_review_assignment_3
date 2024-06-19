#Assignment 2 - Narcissistic Numbers
#Bilal Mohideen - BTC1855H

#Prompts the user to enter a three digit positive number
answer <- readline(prompt = "Please enter a three digit positive number: ")

#Separate number into individual digits with "strsplit" function
#Use "as.numeric" to ensure that "digits" is in numeric form
digits <- as.numeric(strsplit((answer),"")[[1]])

#Calculating the cube of each digit 
digits_cubed <- (digits^3)

#Calculating the sum of cubes
digits_sum <- (sum(digits_cubed))

#Converting "answer" from character data into numeric form
#under new variable "answer_num"
answer_num <- as.numeric(answer)

#Checking if the number is a valid entry 
#(i.e. not a character string)
#by checking if "answer_num" is NA
if (is.na(answer_num)){
  print(paste("Error:", answer, "is not a number."))
#Checking if number is a valid entry that is not less than 3 digits 
#by converting to character form, and using "nchar"
} else if (nchar(as.character(answer_num)) < 3){
  print(paste("Error:", answer, "is less than three digits."))
#Checking if number is a valid entry that is not more than 3 digits 
#by converting to character form, and using "nchar"
} else if (nchar(as.character(answer_num)) > 3){
  print(paste("Error:",answer, "is more than three digits."))
#Checking if number is a valid entry that is not negative 
#Verifying that "answer_num" is not less than 0
} else if (answer_num < 0){
  print(paste("Error:", answer, "is a negative number."))
#The entry is now verified as a three digit positive number
#Checking if "digits_sum" is equal to "answer_num"
#If this is TRUE, then "answer" is an Armstrong number
} else if (digits_sum == answer_num){
  print(paste(answer,"is an Armstrong number."))
#Checking if "digits_sum" is NOT equal to "answer_num"
#If this is TRUE, then "answer" is not an Armstrong number
} else if (digits_sum != answer_num){
  print(paste(answer,"is not an Armstrong number."))
}