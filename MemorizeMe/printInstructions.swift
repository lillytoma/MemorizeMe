//
//  printInstructions.swift
//  MemorizeMe
//
//

func printInstructions() { //function to print out instructions of the game.
    let instructions = """
    
    Instructions:
    - This game has 10 rounds.
    - In the first round, you will memorize one number.
    - After each round, a new number is added to the sequence.
    - You will have 2 seconds to memorize the sequence.
    - After that, you will be prompted to enter the sequence you memorized.
    - If you are correct, you will move on to the next round.
    - If you are incorrect, the game will end.
    - Enter you answer all on one line.
    - It can be entered with spaces in between each number or without spaces.
    
    Would you like a practice round?
    Enter 'Y' for yes or 'N' for no: 
    """
    print(instructions, terminator: "") //terminator is used so the user can input an answer on the same line
}
