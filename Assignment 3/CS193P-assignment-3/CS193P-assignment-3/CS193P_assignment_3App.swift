//
//  CS193P_assignment_3App.swift
//  CS193P-assignment-3
//
//  Created by Jordan Louis on 5/18/23.
//

import SwiftUI

@main
struct CS193P_assignment_3App: App {
    let game = SetGameVM()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
