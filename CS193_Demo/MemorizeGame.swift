//
//  MemorizeGame.swift
//  CS193_Demo
//
struct MemoryGame <CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFacedUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
