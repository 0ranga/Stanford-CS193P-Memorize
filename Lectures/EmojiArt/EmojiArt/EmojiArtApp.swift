//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jordan Louis on 6/4/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
