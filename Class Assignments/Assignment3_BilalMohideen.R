#Assignment 3 - Hangman
#Bilal Mohideen - BTC1855H
#R Version 2024.04.1+748 (2024.04.1+748)

#ensure that word bank (random_foods.txt)
#is saved in working directory
#set to the appropriate working directory
setwd("/Users/bilalmohideen/Desktop/MBiotech - UofT/BTC1855H/BM_BTC1855H/Class Assignments")

#reading word list (food themed in this case)
food_bank <- readLines("random_foods.txt")

#choosing a random element from the list
hidden_word <- sample(food_bank, 1)

#determining the length of the word
length <- nchar(hidden_word)

#creating a function to track number of characters in 
#hidden word, to be displayed as blank spaces
blanks <- rep("_", times = length)


#adding a welcome message with instructions for the game
#user is informed that a maximum of 6 guesses are allowed
#user is informed on the length of the hidden word
cat("     Welcome to Hungry Hangman!
     Your objective is to correctly guess a predetermined word
     All words will be food-themed in Hungry Hangman
     You will be provided with a series of blank spaces
     Each blank space represents a letter in the word
     You may guess one letter at a time, or attempt to guess the entire word
     You win if you can guess the word before the Hangman figure is completed
     Each incorrect single letter guess will result in a different part of the Hangman
     figure added, while a failed attempt to guess the entire word is game over
     Body -> Arms -> Legs -> Head \n
     Users are allowed 6 guesses before the Hangman figure is completed \n
     The word is", length,"letters long")

#user input for guessing either a letter or the entire word
guess <- readline(prompt = "Please enter a letter or word as your guess:")

#creating function for verifying that
#input has no special characters or numbers
#invalid returns TRUE when special characters
#or numbers present

invalid <- function(guess) {
  grepl("[0-9]", guess) || grepl("[^a-zA-Z0-9]", guess)
}

#creating function for input of only 1 letter
#returns TRUE when input is 1 character
single_letter <- function(guess) {
  nchar(guess) == 1
}

#creating function for whole word input
#returns TRUE when input is more than 1 character
whole_word <- function(guess) {
  nchar(guess) > 1
}


