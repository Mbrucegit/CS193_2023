//
//  EmojiMemoryGameView.swift
//  CS193_Demo
//
//  Created by Michael on 3/29/24.


import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            // Allows for user to scroll
            ScrollView { cards }
        }
        .padding()
    }
    
    var cards: some View {
        // creates a vertically scrollable collection of views
        // lazy implies that the views are only created when SwiftUI needs to display them
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.Cards.indices, id: \.self) { index in
                CardView(card: viewModel.Cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            }
            .opacity(card.isFacedUp ? 1:0)
            base.fill().opacity(card.isFacedUp ? 0:1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
