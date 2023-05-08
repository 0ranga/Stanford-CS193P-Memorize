//
//  CS193P_assignment_1App.swift
//  CS193P-assignment-1
//
//  Created by Heesham on 4/6/23.
//

import SwiftUI

@main
struct CS193P_assignment_1App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
