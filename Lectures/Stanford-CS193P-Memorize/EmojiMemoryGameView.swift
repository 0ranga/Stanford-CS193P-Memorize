//
//  EmojiMemoryGameView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame // @ObservedObject means that when this thing changes, we need to redraw the whole body
    
    var body: some View { // this is a function
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(6)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(5)
                        .opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.70
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return Group {
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12")
            EmojiMemoryGameView(game: game)
                .previewInterfaceOrientation(.landscapeLeft)
                .previewDisplayName("landscape")
                .preferredColorScheme(.light)
        }
    }
}
