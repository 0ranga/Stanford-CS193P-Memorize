//
//  ContentView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View { // this is a function
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0) // argument with a label "cornerRadius"
                .stroke(lineWidth: 3)
            
            Text("✈️")
                .font(.largeTitle)
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
