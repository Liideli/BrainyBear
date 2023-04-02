//
//  MathGameView.swift
//  BrainyBear
//
//  Created by iosdev on 2.4.2023.
//

import SwiftUI

class MathGame {
    let num1: Int
    let num2: Int
    // Randomly decide whether to add or subtract the numbers
    let shouldAdd: Bool
    let correctAnswer: Int
    var shuffledAnswers: Array<Int>
    
    init(num1: Int = Int.random(in: 1...10), num2: Int = Int.random(in: 1...10), shouldAdd: Bool = Bool.random()) {
        self.num1 = num1
        self.num2 = num2
        self.shouldAdd = shouldAdd
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
    }
}

let MathGameTest = MathGame()

struct MathGameView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("\(MathGameTest.num1) \(MathGameTest.shouldAdd ? "+" : "-") \(MathGameTest.num2) = ?")
                .font(.largeTitle)
            Spacer()
            HStack(spacing: 10) {
                Button(action: {
                    // button action here
                }) {
                    Text("\(MathGameTest.shuffledAnswers[0])")
                        .frame(maxWidth: 200, maxHeight: 200)
                        .background(Color.blue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                }
                Button(action: {
                    // button action here
                }) {
                    Text("\(MathGameTest.shuffledAnswers[1])")
                        .frame(maxWidth: 200, maxHeight: 200)
                        .background(Color.red)
                        .cornerRadius(15)
                        .font(.largeTitle)
                }
            }
            HStack {
                Button(action: {
                    // button action here
                }) {
                    Text("\(MathGameTest.shuffledAnswers[2])")
                        .frame(maxWidth: 200, maxHeight: 200)
                        .background(Color.green)
                        .cornerRadius(15)
                        .font(.largeTitle)

                }
                Button(action: {
                    // button action here
                }) {
                    Text("\(MathGameTest.shuffledAnswers[3])")
                        .frame(maxWidth: 200, maxHeight: 200)
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
