//
//  EmojiMemoryGame.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/11/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: Array<String> = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame() // private(set) -> other classes can look but not modify it
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards // not return needed since it is the only statement in here
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
//        objectWillChange.send() // not needed because we used the @Published keyword in front of var model
        model.choose(card) // since model.choose is a mutating func, SwiftUI knows automatically that when calling it, it will change, that is how it is linked to the @Published keyword and will call on its own the func objectWillChange()
    }
}
