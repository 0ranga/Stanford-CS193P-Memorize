//
//  EmojiMemoryGame.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 5/7/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
        
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"]
    
    static func createMemoryGame(for theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairs: theme.numberOfPairs, createCardContent: {(pairIndex: Int) in
            return theme.emojiSet[pairIndex]
        })
    }
    
    static let transportTheme: Theme = Theme(name: "Transport", emojiSet: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"], color: "red", numberOfPairs: 4)
    
    static let deviceTheme: Theme = Theme(name: "Transport", emojiSet: ["⌚️", "📱", "🕹️", "📀", "🎞️", "🎛️", "💡", "⏳", "📽️", "💾"], color: "blue", numberOfPairs: 6)
    
    @Published private var model: MemoryGame<String>
    private var currentTheme: Theme
    
    var themeColor: Color {
        switch currentTheme.color {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        default:
            return Color.gray
        }
    }
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Init
    
    init() {
        currentTheme = EmojiMemoryGame.transportTheme
        model = EmojiMemoryGame.createMemoryGame(for: currentTheme)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame() {
        currentTheme = EmojiMemoryGame.deviceTheme
        model = EmojiMemoryGame.createMemoryGame(for: currentTheme)
    }
    
}
