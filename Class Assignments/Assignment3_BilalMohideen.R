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
#IE - this is an efficient way to pick a word ranomly, well done!
hidden_word <- sample(food_bank, 1)

#determining the length of the word
word_length <- nchar(hidden_word)

#setting the maximum amount of attempts to 5
#IE - 5 attempts might be a little tough for the user
max_attempts <- 5

#creating a variable to track the number of attempts
attempts <- 0

#creating a variable to store all incorrect guesses
incorrect <- character()

#creating a variable to store all correct guesses
correct <- character()

#IE - for the purpose of easier readability, I would reccomend all functions to be defined at the top so that your main code is not split in the middle
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
#IE - this may be a mistake in your comments, I beleive the max number of guesses allowed was 5
#user is informed on the length of the hidden word
#IE - this is a very informative message, well done! Also I like the food theme!
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
  #IE - I do not think the repeat{} loop is necessary
  repeat{
    #user input for guessing either a letter or the entire word
    #converts to lowercase to match with words in food_bank
    #IE - it was a wise choice to use the tolower() function since your txt file contains only lowecase words
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
        #IE - is it really necessary to break the loop manually since you adjusted the attempts variable to be greater than max_attempts? The condition for the while loop will not be met anyways.
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

#' Overall feedback from IE:
#' Excellent work Bilal, I am really excited to see how this assignment looks when it is finished. I think your code is clean and efficient; I appreciate
#' the use of variable names that make it easy to understand what your code is doing. On a similar note, your commenting is well done especially when explaining
#' what your functions do. I also like that you used functions in order to keep your main loop more clutter free. I am not 100% clear on what the repeat loop within
#' your main while loop is doing. Your while loop alone can ensure the prompt is repeated as many times as the attempts allowed. If you want to ensure that invalid
#' input does not count towards the user's guesses, you can use a smaller repeat loop containing the readline statment and only exit the loop if the input is valid.
#' I would also suggest you print the user's progress and use dashes or underscores to visually represnt the letters that have not yet been guessed. Finally,
#' I really like that your code determines if the user is guessing a word or a letter automatically, this makes the game feel smoother than making the user select what
#' type of guess they will opt for. Overall great work!!!
