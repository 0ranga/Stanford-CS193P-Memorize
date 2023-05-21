//
//  SetGameVM.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/20/23.
//

import SwiftUI

class SetGameVM: ObservableObject {
    
    @Published var model = SetGame()
    
    var cards: [SetGame.Card] {
        model.cards
    }
}
