//
//  ContentView.swift
//  Stanford-CS193P-Memorize
//
//  Created by Heesham on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View { // this is a function
        ZStack {
            RoundedRectangle(cornerRadius: 25.0) // argument with a label "cornerRadius"
                .stroke(lineWidth: 3)
            
            Text("Hello, world!")
                .foregroundColor(.orange)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        

        
        
        
        
        
        
        
        
        
        
//        return Text("Hello, world!") // what the function returns, Text also behaves like a view
//            .foregroundColor(Color.orange)
//            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // .padding is a func that exists in all structs that behave like a view
//        // padding func returns something that behaves like a view (a padded modified other view) ≠ than Text
//        // padding is considered as a view modifier, when we use a view modifier it is going to return a new view
        
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
