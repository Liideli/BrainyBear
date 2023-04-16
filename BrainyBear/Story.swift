//
//  Story.swift
//  BrainyBear
//
//  Created by Tushar Nafisul on 8.4.2023.
//

import Foundation

struct Story: Decodable {
    let id: Int
    let title: String
    let author: String
    let content: String
}

class StoryManager {
    static let shared = StoryManager()
    private var stories = [Story]()
    
    private init() {
        guard let url = Bundle.main.url(forResource: "stories", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([Story].self, from: data) else {
            return
        }
        stories = decodedData
    }
    
    func getStories() -> [Story] {
        return stories
    }
}


