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
    
    private var lastChosenTime: Date?
    
    //max(10 - (number of seconds since last card was chosen), 1) x (the number of points you would have otherwise earned or been penalized with)
    
    private(set) var score = 0
    
    mutating func choose(_ card: Card) {
        
        if let currentIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[currentIndex].isMatched,
           !cards[currentIndex].isFaceUp {
            
            let currentTime = Date.now
            let oldTime = lastChosenTime ?? nil
            lastChosenTime = currentTime
            
            
            if let indexPotentialMatch = indexOfFaceUpCard {
                // 2 cards are up
                if cards[currentIndex].content == cards[indexPotentialMatch].content {
                    // if match
                    cards[currentIndex].isMatched = true
                    cards[indexPotentialMatch].isMatched = true
                    
                    score = score + max(10 - Int(DateInterval(start: oldTime!, end: currentTime).duration.rounded()), 1)*2
                } else {
                    
                    for i in [currentIndex, indexPotentialMatch] {
                        if cards[i].seen {
                            score = score + max(10 - Int(DateInterval(start: oldTime!, end: currentTime).duration.rounded()), 1)*(-1)
                        }
                    }

                }
                indexOfFaceUpCard = nil
                
            } else {
                // only one card up
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].seen = true
                    }
                    cards[index].isFaceUp = false
                }
                // becomes the face up card
                indexOfFaceUpCard = currentIndex
            }
            cards[currentIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent?) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            if let content = createCardContent(pairIndex) {
                cards.append(Card(content: content, id: pairIndex*2))
                cards.append(Card(content: content, id: pairIndex*2+1))
            }
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var seen = false
        var id: Int
    }
}
