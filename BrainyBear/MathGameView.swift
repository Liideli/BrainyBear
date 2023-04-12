//
//  MathGameView.swift
//  BrainyBear
//
//  Created by iosdev on 2.4.2023.
//

import SwiftUI

struct MathGameView: View {

    @ObservedObject var mathGame = MathGameViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("💰 \(mathGame.currentUser.getCoins())")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.bbBabyBlue, in: Capsule())
                    .font(.custom("Verdana", fixedSize: 25))
                    .padding()
            }
            VStack {
                Spacer()
                Text("\(mathGame.num1) \(mathGame.shouldAdd ? "+" : "-") \(mathGame.num2) = ?")
                    .font(.custom(
                        "AmericanTypewriter",
                        fixedSize: 60))
                Spacer()
            }
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
                        .foregroundColor(Color.white)
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[1])) {
                        print("Answer correct!")
                    } else {
                        print("Answer incorrect!!")
                    }}) {
                    Text("\(mathGame.shuffledAnswers[1])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.red)
                        .cornerRadius(15)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
            }
            HStack {
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[2])) {
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
                        .foregroundColor(Color.white)
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[3])) {
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
                        .foregroundColor(Color.white)
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
