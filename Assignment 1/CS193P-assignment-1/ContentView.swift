//
//  ContentView.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    var theme1 = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"]
    var theme2 = ["⌚️", "📱", "🕹️", "📀", "🎞️", "🎛️", "💡", "⏳", "📽️", "💾"]
    var theme3 = ["🍐", "🍆", "🍓", "🍋", "🫚", "🥒", "🍑", "🌽"]

    @State var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎️", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶"]
    @State var emojiCount = 13
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let area = (screenWidth*0.8) * (screenHeight*0.8)
        let cardArea: CGFloat = area/CGFloat(cardCount)
        let width = sqrtf(2*Float(cardArea)/3)
        
        return CGFloat(width*0.75)
    }
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            NavBar
        }
        .padding()
    }
    
    var NavBar: some View {
        HStack{
            Spacer()
            VStack{
                Button(action: {
                    emojiCount = Int.random(in: 4...theme1.count)
                    emojis = theme1.shuffled()
                }, label: {
                    Image(systemName: "car")
                })
                Text("Vehicles").font(.subheadline)
            }

            Spacer()
            VStack {
                Button(action: {
                    emojiCount = Int.random(in: 4...theme2.count)
                    emojis = theme2.shuffled()
                }, label: {
                    Image(systemName: "gamecontroller")
                })
                Text("Objects").font(.subheadline)
            }
            Spacer()
            VStack {
                Button(action: {
                    emojiCount = Int.random(in: 4...theme3.count)
                    emojis = theme3.shuffled()
                }, label: {
                    Image(systemName: "carrot")
                })
                Text("Fruits").font(.subheadline)
            }
            Spacer()
        }
        .font(.custom("Navbar", size: 50))
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle).padding()
            } else {
                shape.fill()
            }
        }
        .onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}

struct NavBar: View {
    @State var theme = 1
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                theme = 1
            }, label: {
                Image(systemName: "car.circle")
            })
            Spacer()
            Button(action: {
                theme = 2
            }, label: {
                Image(systemName: "plus.circle")
            })
            Spacer()
            Button(action: {
                theme = 3
            }, label: {
                Image(systemName: "plus.circle")
            })
            Spacer()
        }
        .font(.custom("Navbar", size: 50))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Landscape")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
