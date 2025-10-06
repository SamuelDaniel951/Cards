//
//  CardToolbar.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

struct CardToolbar: ViewModifier {
  @EnvironmentObject var store: CardStore //"" added to access shared card data
  @Environment(\.dismiss) var dismiss
  @Binding var currentModal: ToolbarSelection?
  @Binding var card: Card
  @State private var stickerImage: UIImage?
  @State private var frameIndex: Int? //"" added for frame selection

  func body(content: Content) -> some View {
    content
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          menu //"" added new toolbar menu for adding elements
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss()
          }
        }
        ToolbarItem(placement: .bottomBar) {
          BottomToolbar(
            card: $card, //"" added to pass current card to toolbar
            modal: $currentModal)
        }
      }
      .sheet(item: $currentModal) { item in
        switch item {
        case .frameModal: //"" new frame modal handling
          FrameModal(frameIndex: $frameIndex)
            .onDisappear {
              if let frameIndex {
                card.update(
                  store.selectedElement,
                  frameIndex: frameIndex)
              }
              frameIndex = nil
            }
        case .stickerModal:
          StickerModal(stickerImage: $stickerImage)
            .onDisappear {
              if let stickerImage = stickerImage {
                card.addElement(uiImage: stickerImage)
              }
              stickerImage = nil
            }
        default:
          Text(String(describing: item))
        }
      }
  }

  //"" new menu for pasting images or text onto a card
  var menu: some View {
    Menu {
      Button {
        if UIPasteboard.general.hasImages {
          if let images = UIPasteboard.general.images {
            for image in images {
              card.addElement(uiImage: image)
            }
          }
        } else if UIPasteboard.general.hasStrings {
          if let strings = UIPasteboard.general.strings {
            for text in strings {
              card.addElement(text: TextElement(text: text))
            }
          }
        }
      } label: {
        Label("Paste", systemImage: "doc.on.clipboard")
      }
      .disabled(!UIPasteboard.general.hasImages
        && !UIPasteboard.general.hasStrings)
    } label: {
      Label("Add", systemImage: "ellipsis.circle")
    }
  }
}
