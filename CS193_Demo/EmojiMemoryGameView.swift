//
//  EmojiMemoryGameView.swift
//  CS193_Demo
//
//  Created by Michael on 3/29/24.


import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            // Allows for user to scroll
            ScrollView {
                cards
            }
            //button is a user intent
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        // creates a vertically scrollable collection of views
        // lazy implies that the views are only created when SwiftUI needs to display them
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 0)], spacing: 0) {
            ForEach(viewModel.Cards.indices, id: \.self) { index in
                CardView(viewModel.Cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    let base = RoundedRectangle(cornerRadius: 12)
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFacedUp ? 1:0)
            base.fill()
                .opacity(card.isFacedUp ? 0:1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
