//
//  SingleCardView.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

struct SingleCardView: View {
  @Binding var card: Card
  @State private var currentModal: ToolbarSelection?

  var body: some View {
    NavigationStack {
      CardDetailView(card: $card)
        .modifier(CardToolbar(
          currentModal: $currentModal,
          card: $card))
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  struct SingleCardPreview: View {
    @EnvironmentObject var store: CardStore
    var body: some View {
      SingleCardView(card: $store.cards[0])
    }
  }
  static var previews: some View {
    SingleCardPreview()
      .environmentObject(CardStore(defaultData: true))
  }
}
