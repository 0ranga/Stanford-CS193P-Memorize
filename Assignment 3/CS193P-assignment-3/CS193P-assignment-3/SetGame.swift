//
//  Model.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/20/23.
//

import Foundation

struct SetGame {
    
    var cards: Array<Card>
    var cardsLeftToDeal: Array<Card> { cards.filter({ $0.hasBeenDealt == false }) }
    var numberOfCardsLeftToDeal: Int { cardsLeftToDeal.count }
    
    init(){
        cards = []
        var id = 0
        for shap in Shape.allCases {
            for col in Color.allCases {
                for shad in Shading.allCases {
                    for n in 1...3 {
                        cards.append(Card(numberOfShapes: n, shape: shap, color: col, shading: shad, id: id))
                        id+=1
                    }
                }
            }
        }
        cards.shuffle()
        for n in 0..<12 {
            cards[n].hasBeenDealt = true
        }
    }
    
    mutating func dealThreeCards() {
        let x = cardsLeftToDeal
        guard numberOfCardsLeftToDeal >= 3 else {
            return
        }
        for i in 0..<3 {
            let toDistributeIndex = cards.firstIndex(where: { selfCard in
                selfCard.id == x[i].id
            })
            if let toDistributeIndex {
                cards[toDistributeIndex].hasBeenDealt = true
            }
            
        }
    }
    
    mutating func newGame() {
        self = SetGame.init()
    }
    
    struct Card: Identifiable {
        let numberOfShapes: Int
        let shape: Shape
        let color: Color
        let shading: Shading
        var isMatched: Bool = false
        var hasBeenDealt: Bool = false
        let id: Int
    }
    
    enum Shape: CaseIterable {
        case diamond
        case squiggles
        case oval
    }
    
    enum Color: CaseIterable {
        case red
        case green
        case blue
    }
    
    enum Shading: CaseIterable {
        case plain
        case striped
        case bordered
    }
}
