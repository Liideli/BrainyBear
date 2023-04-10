//
//  StoryUI.swift
//  BrainyBear
//
//  Created by Tushar Nafisul on 8.4.2023.
//

import SwiftUI



struct StoryUI: View {
    @State private var currentIndex = 0
        let stories = StoryManager.shared.getStories()
        
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
