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
        VStack {
            gameBody
            deckBody
            shuffle
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
//                Rectangle().opacity(0)
                Color.clear // color can behave like a view in the right context, used as a view -> rectangle
            } else {
                CardView(card: card)
                    .padding(6)
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                    }
            }
        }
        .onAppear {
            // deal cards
            withAnimation(.easeInOut(duration: 5)) {
                for card in game.cards {
                    deal(card)
                }
            }
        }
        .foregroundColor(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                    CardView(card: card)
                        .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .scale))
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(CardConstants.color)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                game.shuffle()
            }
        }
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
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
                    Text(card.content)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .font(Font.system(size: DrawingConstants.fontSize))
                        .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.70
        static let fontSize: CGFloat = 32
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
