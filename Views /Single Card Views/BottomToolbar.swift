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
  @Binding var modal: ToolbarSelection?
//toolbar buttons
  var body: some View {
    HStack {
      ForEach(ToolbarSelection.allCases) { selection in
        Button {
          modal = selection
        } label: {
          ToolbarButton(modal: selection)
        }
      }
    }
  }
}

struct BottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    BottomToolbar(modal: .constant(.stickerModal))
      .padding()
  }
}
