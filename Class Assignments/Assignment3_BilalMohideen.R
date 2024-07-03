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
word_length <- nchar(hidden_word)

#setting the maximum amount of attempts to 5
max_attempts <- 5

#creating a variable to track the number of attempts
attempts <- 0

#creating a variable to store all incorrect guesses
incorrect <- character()

#creating a variable to store all correct guesses
correct <- character()

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

#creating object to store individual letters of hidden_word 
word_letters <- strsplit(hidden_word, NULL)[[1]]

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
     Users are allowed 5 guesses before the Hangman figure is completed \n
     The word is", word_length,"letters long")

#while loop that will run as long as
#there are more max attempts remaining than
#user attempts
#once max_attempts > attempts, game over
while (max_attempts > attempts) {
  #repeats the word/letter prompt for user after each guess
  repeat{
    #user input for guessing either a letter or the entire word
    #converts to lowercase to match with words in food_bank
    guess <- tolower(readline(prompt = "Please enter a letter or word as your guess:"))
    
    #if the guess contains special characters
    #no need to add an attempt (user is not penalized for invalid entry)
    if (invalid(guess) == TRUE) {
      cat("Invalid entry.\n")
    }
    #if the user attempts to guess a single letter
    else if (single_letter(guess) == TRUE) {
      cat("You have entered a letter.")
      if (guess %in% word_letters) {
        cat("\nCongrats! This letter is in the word.")
        attempts <- attempts +1
      } else {
        cat("\nSorry, that letter is not in the word.")
        attempts <- attempts +1
      }
    }
    #if the user attempts to guess the entire word
    #setting attempts to max_attempts to break the loop
    #if user's guess and hidden_word are identical, then the user wins
    #initial input for guess already converted to lowercase
    else if (whole_word(guess) == TRUE) {
      cat("You have entered a word. ")
      if (identical(hidden_word, guess) == TRUE) {
        cat("\nCongrats! You have guessed the entire word.")
        attempts = max_attempts + 1
        break
      }
      else {
        cat("\nSorry, that guess is not the word. Game over :( The word was", hidden_word)
        attempts = max_attempts + 1
        break
      }
    }
  }
}
#still need to add: current progress updates, visual cue for user
#else statement if user already guessed a letter, storing guesses,
#end while loop, reset/ask if user wants to play again
