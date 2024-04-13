//
//  EmorjiMemoryGame.swift
//  CS193_Demo
//
//  Created by Michael on 4/13/24.
//

import SwiftUI

class EmojiMemoryGame {
    //static make the variable global, but only use in the class
    private static let emorjis = ["👻", "🎃", "🦇","🧛","⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    
    // return type must be explicit
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairOfCards: 6) {pairIndex in
            if emorjis.indices.contains(pairIndex) {
                return emorjis[pairIndex]
            } else {
                return "⁉️"
            }
        
    }
    }
    //$0 is the first argument
    //access control private
    private var model = EmojiMemoryGame.createMemoryGame()
    
    var Cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
