//
//  EmorjiMemoryGame.swift
//  CS193_Demo
//
//  Created by Michael on 4/13/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //static make the variable global, but only use in the class
    private static let emojis = ["👻", "🎃", "🦇","🧛","⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    
    // return type must be explicit
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairOfCards: 12) {pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        
    }
    }
    
    //$0 is the first argument
    //access control private
    //Mark objectchanged
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var Cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: -Intents
    
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
