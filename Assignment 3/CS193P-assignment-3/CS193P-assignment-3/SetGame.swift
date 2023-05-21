//
//  Model.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/20/23.
//

import Foundation

struct SetGame {
    
    var cards: Array<Card>
    
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
        for n in 1...12 {
            cards[n].isFaceUp = true
        }
    }
    
    struct Card: Identifiable {
        let numberOfShapes: Int
        let shape: Shape
        let color: Color
        let shading: Shading
        var isMatched: Bool = false
        var isFaceUp: Bool = false
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
