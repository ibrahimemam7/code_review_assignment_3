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

#adding a welcome message with instructions for the game
#user is informed that a maximum of 6 guesses are allowed
#user is informed on the length of the hidden word
cat("     Welcome to Hungry Hangman!
     Your objective is to correctly guess a predetermined word
     All words will be food-themed in Hungry Hangman
     You will be provided with a series of blank spaces
     Each blank space represents a letter in the word
     You may guess one letter at a time, or attempt to guess the entire word
     You win if you can guess the word before the hangman figure is completed
     Each incorrect guess will result in a different part of the Hangman figure added
     Body -> Arms -> Legs -> Head \n
     Users are allowed 6 guesses before the Hangman figure is completed\n
     The word is", nchar(hidden_word),"letters long")