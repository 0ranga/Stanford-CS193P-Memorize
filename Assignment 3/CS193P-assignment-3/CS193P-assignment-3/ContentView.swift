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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], content: {
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
                    shape(cardShape: card.shape)
                        .foregroundColor(color(cardColor: card.color))
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func shape(cardShape: SetGame.Shape) -> some View {
        Group {
            switch cardShape {
            case .diamond:
                Rectangle().strokeBorder(lineWidth: 3)
            case .squiggles:
                Rectangle()
            case .oval:
                RoundedRectangle(cornerRadius: 20)
            }
        }
        .aspectRatio(2/1, contentMode: .fit)
    }
    
    private func color(cardColor: SetGame.Color) -> Color {
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
