//
//  SetGameVM.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/20/23.
//

import SwiftUI

class SetGameVM: ObservableObject {
    
    @Published private var model = SetGame()
    
    var cards: [SetGame.Card] {
        model.cards
    }
    
    var cardsLeftToDeal: Array<SetGame.Card> {
        model.cardsLeftToDeal
    }
    
    var numberOfCardsLeftToDeal: Int {
        model.numberOfCardsLeftToDeal
    }
    
    // MARK: - Intent
    
    func dealThreeCards() {
//        print(model.isASet(card1: cards[0], card2: cards[3], card3: cards[6]))
        model.dealThreeCards()
    }
    
    func newGame() {
        model = SetGame()
    }
    
    func select(card: SetGame.Card) {
        model.select(card: card)
    }
    
    func isASet(card1: SetGame.Card, card2: SetGame.Card, card3: SetGame.Card) -> Bool {
        model.isASet(card1: card1, card2: card2, card3: card3)
    }
}
