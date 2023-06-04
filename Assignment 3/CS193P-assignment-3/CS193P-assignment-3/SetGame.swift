//
//  Model.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/20/23.
//

import Foundation

struct SetGame {
    
    private(set) var cards: Array<Card>
    var cardsLeftToDeal: Array<Card> { cards.filter({ $0.hasBeenDealt == false }) }
    var numberOfCardsLeftToDeal: Int { cardsLeftToDeal.count }
    
    private var cardsSelected: [Card] {
        get {
            cards.filter({$0.isSelected == true})
        }
    }
    
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
    
    mutating func select(card: Card) {
        if cardsSelected.count == 3 {
            return
        }
        if cardsSelected.count < 3 || card.isSelected {
            let indexOfSelected = cards.firstIndex(where: {$0.id == card.id})
            if let indexOfSelected {
                cards[indexOfSelected].isSelected.toggle()
                if cardsSelected.count == 3 {
                    let isASet = isASet(card1: cardsSelected[0], card2: cardsSelected[1], card3: cardsSelected[2])
                    if isASet {
                        cards.indices.forEach { index in
                            if cardsSelected.contains(where: { cards[index].id == $0.id}) {
                                cards[index].isMatched = .positive()
                            }
                        }
                    } else {
                        cards.indices.forEach { index in
                            if cardsSelected.contains(where: { cards[index].id == $0.id}) {
                                cards[index].isMatched = .negative()
                            }
                        }
                    }
                }
            }
            
            
        }
    }
    
    private func isShapeASet(card1: Card, card2: Card, card3: Card) -> Bool {
        if card1.shape == card2.shape && card2.shape == card3.shape {
            return true
        } else if card1.shape != card2.shape && card2.shape != card3.shape && card1.shape != card3.shape {
            return true
        } else {
            return false
        }
    }
    
    private func isShadingASet(card1: Card, card2: Card, card3: Card) -> Bool {
        if card1.shading == card2.shading && card2.shading == card3.shading {
            return true
        } else if card1.shading != card2.shading && card2.shading != card3.shading && card1.shading != card3.shading {
            return true
        } else {
            return false
        }
    }
    
    private func isColorASet(card1: Card, card2: Card, card3: Card) -> Bool {
        if card1.color == card2.color && card2.color == card3.color {
            return true
        } else if card1.color != card2.color && card2.color != card3.color && card1.color != card3.color {
            return true
        } else {
            return false
        }
    }
    
    private func isNumberASet(card1: Card, card2: Card, card3: Card) -> Bool {
        if card1.numberOfShapes == card2.numberOfShapes && card2.numberOfShapes == card3.numberOfShapes {
            return true
        } else if card1.numberOfShapes != card2.numberOfShapes && card2.numberOfShapes != card3.numberOfShapes && card1.numberOfShapes != card3.numberOfShapes {
            return true
        } else {
            return false
        }
    }
    
    func isASet(card1: Card, card2: Card, card3: Card) -> Bool {
        if isColorASet(card1: card1, card2: card2, card3: card3) && isShapeASet(card1: card1, card2: card2, card3: card3) && isNumberASet(card1: card1, card2: card2, card3: card3) && isShadingASet(card1: card1, card2: card2, card3: card3) {
            return true
        } else {
            return false
        }
    }
    
    struct Card: Identifiable {
        let numberOfShapes: Int
        let shape: Shape
        let color: Color
        let shading: Shading
        var isMatched: ThreeState = .neutral()
        var hasBeenDealt: Bool = false
        var isSelected: Bool = false
        let id: Int
    }
    
    enum ThreeState {
        case neutral(Bool? = nil)
        case positive(Bool? = true)
        case negative(Bool? = false)
        
        func get() -> Bool? {
            switch self {
            case .neutral(let state):
                return state
            case .positive(let state):
                return state
            case .negative(let state):
                return state
            }
        }
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
