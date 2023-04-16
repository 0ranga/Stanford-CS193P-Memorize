//
//  ContentView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍️", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    // OR var emojis: [String] = ["🚂", "🚀", "🚁", "🚜"]
    
   @State var emojiCount: Int = 20
    
    var body: some View { // this is a function
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true // state makes it a pointer to a bool somewhere in memory, pointer does not change but value pointed to changes
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                    .padding()
            } else {
                shape.fill()
            }
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12")
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .previewDisplayName("landscape")
            .preferredColorScheme(.light)
    }
}
