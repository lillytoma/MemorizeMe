//
//  myGame.swift
//  MemorizeMe
//
//  Created by Lilly Toma on 11/21/24.
//
import Foundation
import Darwin

var userName = [String]() // makes a array for the user name/s
var highestScore = [Int]() //this is where we will combine the name array with the random numbers to get a high score

func myGame() { //main function of our game, where all the logic lies.
    
    var guessArray = [Int]() //creates a new array
    
    //BEGINNING OF THE GAME
    print("                              Welcome to our Game!") //just prints a welcome to out game
    dontScroll()//prints out the name of our game using the function from above
    print("\n                                   The Goal:") //another print statement that gets ready to introduce our goal of the game
    memorizeMe() //prints out "memorize me" using the function above
    
    //print("User Name: \(userName), Highest Level Reached \(outputArray)")
    print("\n                                   The Competition:")
    
    leaderBoard()
    
    
    for i in userName.indices{
        print(userName[i] + " Reached Level: " + String(highestScore[i])) //["hello","lilly","Cam"]
        //index -       0       1       2
    }
    
    printInstructions() //prints out the intructions
    
    if var userChoice = readLine(){ //The user is suposed to enter Y for a practice round or N for no practice round
        userChoice = userChoice.uppercased() //incase the user enters a lower case letter, we automatically turn it into an uppercase letter
        
        if userChoice == "Y"{ //if the user enters Y then enter here
            
            var guessArray = [Int]() //creates a new array, where we will be storing out random numbers that the user has to memorize
            
            
            for index in 1...2 {// the loop will go one two times, starting from round 1 to round 2
                
                let currRound = index //we are using the index of the loop to tell the user which round they are at
                
                let userArrayRandom1 = Int.random(in: 1..<10) // Generates the random number to enter into the array
                
                guessArray.append(userArrayRandom1) // Appends the random number to the array after every loop
                
                let stringArray = guessArray.map(String.init) // [1, 2, 3, 4] -> ["1", "2", "3", "4"], the first step to convert the array into a //string
                
                // Display the current state of the guess array
                print("\nRound \(currRound): Memorize \(guessArray)") //print out the current round and to array that needs to be memorized
                print("Do not input anything yet!") //telling the user to not input anything at this point
                
                // Delay to allow the user to see the array
                Thread.sleep(forTimeInterval: 3.0) //sleep for 3 seconds so they have time to read the screen
                
                //clearConsole() //clear the console, however swift wasnt cooperating with us
                
                
                for _ in 1 ... 100{ //prints out a bunch of new lines to "refresh" the terminal
                    print("\n", terminator: "")
                }
                
                // Ask for user input
                print("Enter the sequence you memorized: ", terminator: "") //Time for the user to input what they have memorized
                if let userInput = readLine() { //allows the user to enter in an input
                    let userInputNoSpaces = userInput.filter{!$0.isWhitespace} //this line removes all the spaces from the users //input using a .filter method
                    
                    if userInputNoSpaces == stringArray.joined() { //check if the user input is equal to the array that they should have memorized
                        print("\nYou have memorized correctly!\n") //if they have congratulate them and move on with the loop
                        continue
                    } else {
                        print("Sorry, you did not memorize perfectly!") //if they have not memorized properly
                        break //exit the loop
                    }
                }
            }
        }
        if(userChoice != "N" && userChoice != "Y"){ //User didnt enter a Y or an N so call the game from the beginning for proper input
            myGame()
        }
        
    }
    
    print("\nNow that you have made your choice:") //here is where the ACTUAL game starts
    print("-Remember to not input anything unless you have been asked to 'Enter'! ") //prompts the user to hit enter whenever
    //they are ready to start
    print("-If you dare to be ready, Hit Enter to Start!", terminator: "")
    
    
    _ = readLine() //waits for the user to enter space to start the program
    
    
    
    print("Dare devil I see... Enter your name: " , terminator: "") //Asks the user for their name
    
    if let userNameInput = readLine(){ //we begin, asking for a user to input their name
        if userNameInput == "" {
            myGame()
        }
        userName.append(userNameInput) //appends user name every time
        
        let end = 15;
        
        for index in 1...end {
            let currRound = index //we are storing the current round using the index of the loop
            let userArrayRandom1 = Int.random(in: 1..<10) // Generates the random number
            guessArray.append(userArrayRandom1) // Appends a number to the array after every loop
            
            let stringArray = guessArray.map(String.init) // [1, 2, 3, 4] -> ["1", "2", "3", "4"]
            //let stringOutputArray = outputArray.map(String.init)
            
            // Display the current state of the guess array
            print("Round \(currRound): \(guessArray) \n")
            
            // Delay to allow the user to see the array
            Thread.sleep(forTimeInterval: 2.0)
            
            //clearConsole() //clear the console, wouldnt work on swift :(
            
            for _ in 1 ... 100{ //loop a 100 times to print out a bunch of 100 lines to "clear the console"
                print("\n", terminator: "") //clearing the console
            } //"7 6 8 9" // "7689"
            
            print("Enter the sequence you memorized: ", terminator: "") //asking the user for input
            if let userInput = readLine() { //reading for input
                let userInputNoSpaces = userInput.filter{!$0.isWhitespace} //this line removes all the spaces from the users //input using a .filter method
                if userInputNoSpaces == stringArray.joined() { //if the user string is equal to the joined string array of our number //array
                    print("You have memorized perfectly!\n") //print great job!
                    continue //continue with the loop
                }
                if index == end{
                    print("Congratulations, You have mastered the game! I shall bow down to you my master.")
                    highestScore.append(index)
                    break;
                }
                else {
                    print("Sorry, you did not memorize perfectly!") //if the user didnt memorize properly print out a sorry
                    highestScore.append(index) //append the round they are currently at to the array which keeps the highest //rounds completed for the leader board
                    print("However, \(userNameInput) you have scored \(index)/15") //print to the user what level they made it to
                    break;
                }
            }
        }
        print("\nWould you like to play again? Y for yes N for no: ")
        print("In order to look back at the leader board you must enter 'Y': ", terminator: "")
        if let userChoice2 = readLine()?.uppercased(){
            if userChoice2 == "Y"{
                myGame()
            }
            if userChoice2 == "N"{
                exit(0)
            }
            else{
                myGame()
            }
        }
    }
}
