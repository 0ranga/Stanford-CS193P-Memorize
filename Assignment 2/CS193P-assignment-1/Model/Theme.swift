//
//  Theme.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 5/8/23.
//

import Foundation

struct Theme {
    
    let name: String
    let emojiSet: Array<String>
    let color: String
    let numberOfPairs: Int
    
    
    // inits for extra credit 1
    init(name: String, emojiSet: Array<String>, color: String, numberOfPairs: Int) {
        self.name = name
        self.emojiSet = emojiSet
        self.color = color
        self.numberOfPairs = numberOfPairs
    }
    
    init(name: String, emojiSet: Array<String>, color: String) {
        self.name = name
        self.emojiSet = emojiSet
        self.color = color
        self.numberOfPairs = emojiSet.count
    }
    
    init(name: String, emojiSet: Array<String>, color: String, random: Bool) {
        self.name = name
        self.emojiSet = emojiSet
        self.color = color
        if random == true {
            self.numberOfPairs = Int.random(in: 1...emojiSet.count)
        } else {
            self.numberOfPairs = emojiSet.count
        }
    }
    
}
