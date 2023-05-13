//
//  ContentView.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.themeName).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) {
                        card in
                        CardView(card: card, themeColor: viewModel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
//            .foregroundColor(viewModel.themeColor[0])
            Text("Score: \(String(viewModel.score))").font(.title2)
            Button(action: {
                viewModel.newGame()
            }, label: {
                Text("New Game").font(.title)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let themeColor: [Color]
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.white)

                shape.strokeBorder(Gradient(colors: themeColor), lineWidth: 3)
                Text(card.content).font(.largeTitle).padding()
            } else if card.isMatched {
                shape.opacity(0)
            } else {
//                shape.fill()
                shape.fill(Gradient(colors: themeColor))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewDisplayName("Landscape")
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView(viewModel: game)
            .previewDisplayName("iPad")
            .previewDevice("iPad mini (6th generation)")

    }
}
