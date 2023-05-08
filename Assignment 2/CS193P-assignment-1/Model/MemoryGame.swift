//
//  MemoryGame.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 5/7/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        
        if let currentIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[currentIndex].isMatched,
           !cards[currentIndex].isFaceUp {
            if let indexPotentialMatch = indexOfFaceUpCard {
                // 2 cards are up
                if cards[currentIndex].content == cards[indexPotentialMatch].content {
                    // if match
                    cards[currentIndex].isMatched = true
                    cards[indexPotentialMatch].isMatched = true
                }
                indexOfFaceUpCard = nil
            } else {
                // only one card up
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                // becomes the face up card
                indexOfFaceUpCard = currentIndex
            }
            cards[currentIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var id: Int
    }
}
