//
//  MathGameView.swift
//  BrainyBear
//
//  Created by iosdev on 2.4.2023.
//

import SwiftUI
import CoreData

struct MathGameView: View {

    @ObservedObject var mathGame = MathGameViewModel()
        
    @State private var coins: Int?

    var body: some View {
        Color.bbLightBrown
            .ignoresSafeArea()
            .overlay(
        VStack{
            HStack {
                Spacer()
                Text("💰 \(coins ?? 0)")
                    .onAppear(perform: {
                        coins = DataController.shared.fetchScore()
                    })
                    .foregroundColor(Color.bbBlack)
                    .padding()
                    .background(Color.bbLilac, in: Capsule())
                    .shadow(radius: 5)
                    .font(.custom("Verdana", fixedSize: 25))
                    .padding()
            }
            VStack {
                Spacer()
                Text("\(mathGame.num1) \(mathGame.shouldAdd ? "+" : "-") \(mathGame.num2) = ?")
                    .font(.custom(
                        "AmericanTypewriter",
                        fixedSize: 60))
                    .padding(30)
                    .background(Color.white, in: Capsule())
                    .padding()
                Spacer()
            }
            HStack {
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[0])) {
                        coins = (coins ?? 0) + 10
                        DataController.shared.saveScore(coins!)
                        print("Answer correct! \(DataController.shared.fetchScore() ?? 0)")
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[0])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.bbBabyBlue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                        .foregroundColor(Color.bbBlack)
                        .shadow(radius: 5)
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[1])) {
                        print("Answer correct! \(coins ?? 0)")
                        coins = (coins ?? 0) + 10
                        DataController.shared.saveScore(coins!)
                    } else {
                        print("Answer incorrect!!")
                    }}) {
                    Text("\(mathGame.shuffledAnswers[1])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.bbBabyBlue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                        .foregroundColor(Color.bbBlack)
                        .shadow(radius: 5)
                }
            }
            HStack {
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[2])) {
                        print("Answer correct! \(coins ?? 0)")
                        coins = (coins ?? 0) + 10
                        DataController.shared.saveScore(coins!)
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[2])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.bbBabyBlue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                        .foregroundColor(Color.bbBlack)
                        .shadow(radius: 5)
                }
                Button(action: {
                    if (mathGame.makeGuess(guess: mathGame.shuffledAnswers[3])) {
                        print("Answer correct! \(coins ?? 0)")
                        coins = (coins ?? 0) + 10
                        DataController.shared.saveScore(coins!)
                    } else {
                        print("Answer incorrect!!")
                    }
                }) {
                    Text("\(mathGame.shuffledAnswers[3])")
                        .frame(maxWidth: 175, maxHeight: 175)
                        .background(Color.bbBabyBlue)
                        .cornerRadius(15)
                        .font(.largeTitle)
                        .foregroundColor(Color.bbBlack)
                        .shadow(radius: 5)
                }
            }
        })
    }

}

struct MathGameView_Previews: PreviewProvider {
    static var previews: some View {
        MathGameView()
    }
}
