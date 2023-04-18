//
//  ContentView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame // @ObservedObject means that when this thing changes, we need to redraw the whole body
    
    var body: some View { // this is a function
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards, content: { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                })
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
                    .padding()
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12")
        ContentView(viewModel: game)
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("landscape")
            .preferredColorScheme(.light)
    }
}
