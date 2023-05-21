//
//  ContentView.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var game: SetGameVM
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], content: {
                ForEach(game.cards, content: { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                })
            })
        }
        .padding()
    }
}

struct CardView: View {
    
    let card: SetGame.Card
    
    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: 15)
            rect.fill().foregroundColor(.white)
            rect.strokeBorder(lineWidth: 2)
            VStack {
                ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                    content(cardShape: card.shape, cardStyle: card.shading)
                        .foregroundColor(cardColor(from: card.color))
                        .aspectRatio(2/1, contentMode: .fit)
                }
            }
            .padding()
        }
    }
    
    private func strokedSymbol<item: Shape>(el: item) -> some View {
        el.stroke(lineWidth: 2)
    }
    
    private func stripedSymbol<item: Shape>(el: item) -> some View {
        el.stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
    }
    
    @ViewBuilder
    private func content(cardShape: SetGame.Shape, cardStyle: SetGame.Shading) -> some View {

        switch cardShape {
            
        case .diamond:
            if cardStyle == .bordered {
                strokedSymbol(el: Diamond())
            } else if cardStyle == .striped {
                stripedSymbol(el: Diamond())
            } else {
                Diamond()
            }

        case .squiggles:
            if cardStyle == .bordered {
                strokedSymbol(el: Rectangle())
            } else if cardStyle == .striped {
                stripedSymbol(el: Rectangle())
            } else {
                Rectangle()
            }
 
        case .oval:
            if cardStyle == .bordered {
                strokedSymbol(el: RoundedRectangle(cornerRadius: .infinity))
            } else if cardStyle == .striped {
                stripedSymbol(el: RoundedRectangle(cornerRadius: .infinity))
            } else {
                RoundedRectangle(cornerRadius: .infinity)
            }
            
        }

    }
    
    private func cardColor(from cardColor: SetGame.Color) -> Color {
        switch cardColor {
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .red:
            return Color.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameVM()
        ContentView(game: game)
    }
}
