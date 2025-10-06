//
//  CardsListView.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI
//app home screen

struct CardsListView: View {
    //save card data
  @EnvironmentObject var store: CardStore
    //select card work space
  @State private var selectedCard: Card?
    //display
  var body: some View {
    list
      .fullScreenCover(item: $selectedCard) { card in
        if let index = store.index(for: card) {
          SingleCardView(card: $store.cards[index])
        } else {
          fatalError("Unable to locate selected card")
        }
      }
  }
    //scroll list 
    var list: some View {
      ScrollView(showsIndicators: false) {
        VStack {
          ForEach(store.cards) { card in
            CardThumbnail(card: card)
              .contextMenu {
                Button(role: .destructive) {
                  store.remove(card)
                } label: {
                  Label("Delete", systemImage: "trash")
                }
              }
              .onTapGesture {
                selectedCard = card
              }
          }
        }
      }
    }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(CardStore(defaultData: true))
  }
}
