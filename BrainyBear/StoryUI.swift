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
    // Localized string keys
    private let titles = ["title1", "title2", "title3"]
    private let stories = ["story1", "story2", "story3"]
    let next:LocalizedStringKey = "next"
    let listen:LocalizedStringKey = "listen"
    let stopListening:LocalizedStringKey = "stopListening"
    let storiesNav:LocalizedStringKey = "storiesNav"
    @State private var isSpeaking = false
    private let synthesizer = AVSpeechSynthesizer()
        var body: some View {
            ScrollView {
                 
                Text(NSLocalizedString(titles[currentIndex], comment: ""))
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                Text(NSLocalizedString(stories[currentIndex], comment: ""))
                        .font(.body)
                        .padding()
                    Button(action: {
                        currentIndex = (currentIndex + 1) % stories.count
                    }, label: {
                        Text(next)
                            .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                    })
                Button(isSpeaking ? stopListening : listen) {
                                   if isSpeaking {
                                       synthesizer.stopSpeaking(at: .immediate)
                                   } else {
                                       let utterance = AVSpeechUtterance(string: NSLocalizedString(stories[currentIndex], comment: ""))
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
                .navigationBarTitle(storiesNav)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .alignmentGuide(.top) { d in d[VerticalAlignment.top] }
            }
        }
    

struct StoryUI_Previews: PreviewProvider {
    static var previews: some View {
        StoryUI()
    }
}
