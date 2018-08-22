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
    
    //random number generator, guesses, other needed code
    let randomNumber = Int(arc4random_uniform(101))
    let guessHigh = "Your guess is too high."
    let guessLow = "Your guess is too Low."
    var guessesLeft = 5
    let won = "You won, you guessed the right number."
    let playAgain = "Would you like to play again (Y/N)?"
    let retry = "Would you like to try again (Y/N)?"
    let lost = "Game Over, the random number was \(randomNumber)."
    let bye = "Goodbye"
    let tryAgain = "Okay, try again."
    
    //comment out if done with testing
    print("random number:\(randomNumber)")
    
    //Welcome the user and prompt them for input
    print("Welcome to the Guessing Game!")
    print("Please guess a number between 0 and 100.")

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
    
}while playingTheGame == true
//ends first repeat and stops code

print("Thank you for playing!")
