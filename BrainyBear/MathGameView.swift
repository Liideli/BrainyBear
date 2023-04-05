//
//  MathGameView.swift
//  BrainyBear
//
//  Created by iosdev on 2.4.2023.
//

import SwiftUI

struct MathGameView: View {
    
    //Observable class for values which are used in math game
    class MathGameViewModel : ObservableObject {
        @Published var num1: Int
        @Published var num2: Int
        // Randomly decide whether to add or subtract the numbers
        @Published var shouldAdd: Bool
        var correctAnswer: Int
        @Published var shuffledAnswers: Array<Int>
        
        // create random wrong answers and add them to answers with the right one, then suffle the array
        init(num1: Int = Int.random(in: 1...10), num2: Int = Int.random(in: 1...10), shouldAdd: Bool = Bool.random()) {
            self.num1 = num1
            self.num2 = num2
            self.shouldAdd = shouldAdd
            self.correctAnswer = shouldAdd ? num1 + num2 : num1 - num2 //get the correct answer to the game
            var answers = Set<Int>()
            answers.insert(correctAnswer)
            //generate 3 random wrong answers
            while answers.count < 4 {
                let answer = Int.random(in: 1...20)
                if answer != correctAnswer {
                    answers.insert(answer)
                }
            }
            // shuffle the answers so that the correct one is not always the first in array
            self.shuffledAnswers = Array(answers)
            shuffledAnswers.shuffle()
        }
        
        // Function to assign new values for the game
        func newGuestion() {
            self.num1 = Int.random(in: 1...10)
            self.num2 = Int.random(in: 1...10)
            self.shouldAdd = Bool.random()
            self.correctAnswer = self.shouldAdd ? self.num1 + self.num2 : self.num1 - self.num2
            var answers = Set<Int>()
            answers.insert(correctAnswer)
            while answers.count < 4 {
                let answer = Int.random(in: 1...20)
                if answer != correctAnswer {
                    answers.insert(answer)
                }
            }
            self.shuffledAnswers = Array(answers)
            shuffledAnswers.shuffle()
            print("\(shuffledAnswers)")
        }
        
        // get the user guess generate a new guess
        func makeGuess (guess: Int) -> Bool {
            if (guess == self.correctAnswer) {
                newGuestion()
                return true
            } else {
                newGuestion()
                return false
            }
        }
    }

    @ObservedObject var mathGame = MathGameViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        VStack(spacing: 10){
            Spacer()
            Text("\(mathGame.num1) \(mathGame.shouldAdd ? "+" : "-") \(mathGame.num2) = ?")
                .font(.largeTitle)
            Spacer()
            HStack(spacing: 10) {
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[0])) {
                        print("Answer correct!")
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[0])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[0])) {
                        print("Answer correct!")
                    } else {
                        print("Answer incorrect!!")
                    }                }) {
                    Text("\(mathGame.shuffledAnswers[1])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.red)
                        .cornerRadius(15)
                        .font(.largeTitle)
                }
            }
            HStack {
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[0])) {
                        print("Answer correct!")
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[2])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.green)
                        .cornerRadius(15)
                        .font(.largeTitle)
                    
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[0])) {
                        print("Answer correct!")
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[3])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.yellow)
                        .cornerRadius(15)
                        .font(.largeTitle)
                }
            }
        }
    }
}

struct MathGameView_Previews: PreviewProvider {
    static var previews: some View {
        MathGameView()
    }
}
