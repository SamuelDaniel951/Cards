//
//  ElementContextMenu.swift
//  Cards
//
//  Created by Madiha Ibrahim on 10/6/25.
//

import SwiftUI

struct ElementContextMenu: ViewModifier {
  @Binding var card: Card //bind to working card
  @Binding var element: CardElement 

  func body(content: Content) -> some View {
    content
      .contextMenu {
        Button {
          if let element = element as? TextElement {
            UIPasteboard.general.string = element.text
          } else if let element = element as? ImageElement,
            let image = element.uiImage {
              UIPasteboard.general.image = image
          }
        } label: {
          Label("Copy", systemImage: "doc.on.doc")
        }
        Button(role: .destructive) {
          card.remove(element)
        } label: {
          Label("Delete", systemImage: "trash")
        }
      }
  }
}

extension View {
  func elementContextMenu(
    card: Binding<Card>,
    element: Binding<CardElement>
  ) -> some View {
    modifier(ElementContextMenu(
      card: card,
      element: element))
  }
}
