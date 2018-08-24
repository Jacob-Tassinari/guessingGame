//
//  main.swift
//  Guessing Game
//
//  Created by Jacob Tassinari on 8/20/18.
//  Copyright © 2018 Jacob Tassinari. All rights reserved.
//

import Foundation

var playingTheGame = true

//first repeat
repeat{
    //Welcome the user
    print("Welcome to the Guessing Game!")
    
    //the amount of guesses are asked and set
    print("Would you like 3, 5, 7 guesses?")
    var userGuessesChoice = Int(readLine()!)
    while userGuessesChoice != 3 && userGuessesChoice != 5 && userGuessesChoice != 7 {
        print("Please retry with a vaild number.")
        userGuessesChoice = Int(readLine()!)
    }
    var guessesLeft = 1
    if userGuessesChoice == 3 {
        guessesLeft = 3
    } else if userGuessesChoice == 5 {
        guessesLeft = 5
    } else if userGuessesChoice == 7 {
        guessesLeft = 7
    }
    
    //the mode  the user wants and all the number generators.
    print("What mode do you want? (10, 50, 100, 150, 200)")
    var userChoiceMode = Int(readLine()!)
    while userChoiceMode != 10 && userChoiceMode != 50 && userChoiceMode != 100 && userChoiceMode != 150 && userChoiceMode != 200 {
        print("Please retry with a vaild number.")
        userChoiceMode = Int(readLine()!)
    }
    var randomNumber = 0
    if userChoiceMode == 10 {
        randomNumber = Int(arc4random_uniform(11))
        print("Please guess a number between 0 and 10.")
    } else if userChoiceMode == 50 {
        randomNumber = Int(arc4random_uniform(51))
        print("Please guess a number between 0 and 50.")
    } else if userChoiceMode == 100 {
        randomNumber = Int(arc4random_uniform(101))
        print("Please guess a number between 0 and 100.")
    } else if userChoiceMode == 150 {
        randomNumber = Int(arc4random_uniform(151))
        print("Please guess a number between 0 and 150.")
    } else if userChoiceMode == 200 {
        randomNumber = Int(arc4random_uniform(201))
        print("Please guess a number between 0 and 200.")
    }

    // for less crowding in the code
    let guessHigh = "Your guess is too high."
    let guessLow = "Your guess is too Low."
    let won = "You won, you guessed the right number."
    let playAgain = "Would you like to play again (Y/N)?"
    let retry = "Would you like to try again (Y/N)?"
    let lost = "Game Over, the random number was \(randomNumber)."
    let bye = "Goodbye"
    let tryAgain = "Okay, try again."

    //comment out if done with testing
    // print("random number:\(randomNumber)")

    // second repeat
    repeat{
        
        //user imput
        var userGuess = Int(readLine()!)

        //input vaildation
        while userGuess == nil {
            print("Please retry with a vaild number.")
            userGuess = Int(readLine()!)
        }
        //Game function
        //if user won and playing again options
        if userGuess == randomNumber {
            print(won)
            print(playAgain)
            var stillPlaying = readLine()!.uppercased()
            while stillPlaying != "Y" && stillPlaying != "N" {
                print(playAgain)
                stillPlaying = readLine()!.uppercased()
            }
            if stillPlaying == "N" {
                print(bye)
                guessesLeft = -1
                playingTheGame = false
            } else if stillPlaying == "Y" {
                print(tryAgain)
                guessesLeft = -1
            }

             //guesses high or low and how many guesses left
        } else if userGuess! > randomNumber {
            print(guessHigh)
            guessesLeft -= 1
            print("You have \(guessesLeft) guesses left.")
        } else if userGuess! < randomNumber {
            print(guessLow)
            guessesLeft -= 1
            print("You have \(guessesLeft) guesses left.")
        }

        // game over, resets or stops the game
        if guessesLeft == 0 {
            print(lost)
            print(retry)
            var stillPlaying = readLine()!.uppercased()
            while stillPlaying != "Y" && stillPlaying != "N" {
                print(retry)
                stillPlaying = readLine()!.uppercased()
            }
            if stillPlaying == "N" {
                print(bye)
                guessesLeft = -1
                playingTheGame = false
            } else if stillPlaying == "Y" {
                print(tryAgain)
                guessesLeft = -1
            }
        }
    }while guessesLeft > 0
    // ends second repeat and either goes on to stop code or restarts
    
} while playingTheGame == true
//ends first repeat and stops code

print("Thank you for playing!")
