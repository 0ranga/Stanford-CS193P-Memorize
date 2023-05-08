//
//  EmojiMemoryGame.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 5/7/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static func createMemoryGame(for theme: Theme) -> MemoryGame<String> {
        
        var emojis = theme.emojiSet
        
        return MemoryGame(numberOfPairs: theme.numberOfPairs >= theme.emojiSet.count ? theme.emojiSet.count : theme.numberOfPairs, createCardContent: {(pairIndex: Int) in
            if let aRandEl = emojis.randomElement() {
                let indexToRemove = emojis.firstIndex(of: aRandEl)!
                return emojis.remove(at: indexToRemove)
            }
            return nil
        })
    }
    
    @Published private var model: MemoryGame<String>
    private var currentTheme: Theme
    private var themes: Array<Theme>
    
    
    var themeColor: Color {
        switch currentTheme.color {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "orange":
            return Color.orange
        case "purple":
            return Color.purple
        default:
            return Color.gray
        }
    }
    
    var themeName: String {
        return currentTheme.name
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Init
    
    init() {
        themes = Array<Theme>()
        themes.append(Theme(name: "Transport", emojiSet: ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"], color: "red", numberOfPairs: 4))
        themes.append(Theme(name: "Device", emojiSet: ["⌚️", "📱", "🕹️", "📀", "🎞️", "🎛️", "💡", "⏳", "📽️", "💾"], color: "blue", numberOfPairs: 10))
        themes.append(Theme(name: "Fruits", emojiSet: ["🍐", "🍆", "🍓", "🍋", "🫚", "🥒", "🍑", "🌽"], color: "purple", numberOfPairs: 14))
        themes.append(Theme(name: "Halloween", emojiSet: ["👻", "🎃", "🕷️"], color: "orange", numberOfPairs: 3))
        
        currentTheme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(for: currentTheme)
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame() {
        currentTheme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(for: currentTheme)
    }
    
}
