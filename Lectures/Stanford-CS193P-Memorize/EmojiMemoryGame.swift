//
//  EmojiMemoryGame.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/11/23.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis: Array<String> = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame() // private(set) -> other classes can look but not modify it
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
