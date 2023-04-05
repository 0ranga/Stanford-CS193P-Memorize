//
//  ContentView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🚂", "🚀", "🚁", "🚜"]
    // OR var emojis: [String] = ["🚂", "🚀", "🚁", "🚜"]
    
    var body: some View { // this is a function
        HStack {
            ForEach(emojis, id: \.self, content: { emoji in
                CardView(content: emoji)
            })
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true // state makes it a pointer to a bool somewhere in memory, pointer does not change but value pointed to changes
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
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
    }
}
