//
//  EmojiMemoryGame.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 5/7/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
        
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"]
    
    static func createMemoryGame(numberOfPairs: Int) -> MemoryGame<String> {
        MemoryGame(numberOfPairs: numberOfPairs, createCardContent: {(pairIndex: Int) in
            return emojis[pairIndex]
        })
    }
    
    private var transportTheme: Theme = Theme(name: "Transport", emojiSet: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"], color: "red", numberOfPairs: 4)
    
    @Published private var model: MemoryGame<String>
    

    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Init
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(numberOfPairs: self.transportTheme.numberOfPairs)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
