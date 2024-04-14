//
//  CS193_DemoApp.swift
//  CS193_Demo
//
//  Created by Michael on 3/29/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
