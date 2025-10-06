//
//  PhotosModal.swift
//  Cards
//
//  Created by owner on 10/6/25.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
  @Binding var card: Card
  @State private var selectedItems: [PhotosPickerItem] = []

    var body: some View {
      PhotosPicker(
        selection: $selectedItems,
        matching: .images
      ) {
        ToolbarButton(modal: .photoModal)
      }
      .onChange(of: selectedItems) { oldItems, newItems in  // iOS 17 update
        Task {
          for item in newItems {
            do {
              if let data = try await item.loadTransferable(type: Data.self),
                 let uiImage = UIImage(data: data) {
                card.addElement(uiImage: uiImage)
              }
            } catch {
              print("⚠️ Image transfer failed: \(error)")
            }
          }
          selectedItems = []
        }
      }
    }

}

struct PhotosModal_Previews: PreviewProvider {
  static var previews: some View {
    PhotosModal(card: .constant(Card()))
  }
}
