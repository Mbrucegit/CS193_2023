//
//  MemorizeGame.swift
//  CS193_Demo
//
struct MemoryGame <CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberofPairsOfCatrds X 2 cards
        for pairIndex in 0..<max(2, numberOfPairOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    //MARK: -Any function modify the model should be marked with mutating
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFacedUp = true
        var isMatched = false
        let content: CardContent
    }
    
}
