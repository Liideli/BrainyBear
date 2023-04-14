//
//  StoryUI.swift
//  BrainyBear
//
//  Created by Tushar Nafisul on 8.4.2023.
//

import SwiftUI
import AVFoundation


struct StoryUI: View {
    @State private var currentIndex = 0
        let stories = StoryManager.shared.getStories()
    @State private var isSpeaking = false
    private let synthesizer = AVSpeechSynthesizer()
        var body: some View {
            ScrollView {
                 
                    Text(stories[currentIndex].title)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    Text(stories[currentIndex].content)
                        .font(.body)
                        .padding()
                    Button(action: {
                        self.currentIndex = (self.currentIndex + 1) % self.stories.count
                    }, label: {
                        Text("Next Story")
                            .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                    })
                Button(isSpeaking ? "Stop Speaking" : "Speak") {
                                   if isSpeaking {
                                       synthesizer.stopSpeaking(at: .immediate)
                                   } else {
                                       let utterance = AVSpeechUtterance(string: stories[currentIndex].content)
                                       synthesizer.speak(utterance)
                                   }
                                   isSpeaking.toggle()
                                    
                               }
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)

                }
                .padding()
                .navigationBarTitle("Stories")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .alignmentGuide(.top) { d in d[VerticalAlignment.top] }
            }
        }
    

struct StoryUI_Previews: PreviewProvider {
    static var previews: some View {
        StoryUI()
    }
}
