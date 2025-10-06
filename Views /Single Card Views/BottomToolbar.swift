//
//  BottomToolbar.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

struct ToolbarButton: View {
  let modal: ToolbarSelection
    //toolbar format
  private let modalButton: [
    ToolbarSelection: (text: String, imageName: String)
  ] = [
    .photoModal: ("Photos", "photo"),
    .frameModal: ("Frames", "square.on.circle"),
    .stickerModal: ("Stickers", "heart.circle"),
    .textModal: ("Text", "textformat")
  ]

  var body: some View {
    if let text = modalButton[modal]?.text,
      let imageName = modalButton[modal]?.imageName {
      VStack {
        Image(systemName: imageName)
          .font(.largeTitle)
        Text(text)
      }
      .padding(.top)
    }
  }
}

//toolbar display
struct BottomToolbar: View {
  @EnvironmentObject var store: CardStore //"" added to access card store data
  @Binding var card: Card //"" added to bind the active card
  @Binding var modal: ToolbarSelection?
//toolbar buttons
  var body: some View {
    HStack {
      ForEach(ToolbarSelection.allCases) { selection in
        switch selection { //"" added to handle special toolbar button actions
        case .photoModal:
          Button {
          } label: {
            PhotosModal(card: $card) //"" opens photo picker modal
          }
        case .frameModal:
          defaultButton(selection)
            .disabled(
              store.selectedElement == nil
              || !(store.selectedElement is ImageElement)) //"" disables frame button if no image selected
        default:
          defaultButton(selection)
        }
      }
    }
  }

  //"" helper for standard toolbar buttons
  func defaultButton(_ selection: ToolbarSelection) -> some View {
    Button {
      modal = selection
    } label: {
      ToolbarButton(modal: selection)
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(
      card: .constant(Card()), //"" added for preview
      modal: .constant(.stickerModal))
    .padding()
    .environmentObject(CardStore()) //"" added for preview environment
  }
}
