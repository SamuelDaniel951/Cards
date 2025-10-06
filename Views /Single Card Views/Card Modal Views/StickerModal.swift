//
//  StickerModal.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

struct StickerModal: View {
  @Environment(\.dismiss) var dismiss //close menu when sticker selected
  @Binding var stickerImage: UIImage? //store which sticker added
  @State private var stickerNames: [String] = []
  let columns = [
    GridItem(.adaptive(minimum: 120), spacing: 10)
  ]
    //scroll and arrange stickers
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(stickerNames, id: \.self) { sticker in
          Image(uiImage: image(from: sticker))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onTapGesture {
              stickerImage = image(from: sticker)
              dismiss()
            }
        }
      }
    }
    .onAppear {
      stickerNames = Self.loadStickers()
    }
  }
    //search app for stickers 
  static func loadStickers() -> [String] {
    var themes: [URL] = []
    var stickerNames: [String] = []
    let fileManager = FileManager.default
    if let resourcePath = Bundle.main.resourcePath,
      let enumerator = fileManager.enumerator(
        at: URL(fileURLWithPath: resourcePath + "/Stickers"),
        includingPropertiesForKeys: nil,
        options: [
          .skipsSubdirectoryDescendants,
          .skipsHiddenFiles
        ]) {
          for case let url as URL in enumerator
          where url.hasDirectoryPath {
            themes.append(url)
          }
    }
    for theme in themes {
      if let files = try?
      fileManager.contentsOfDirectory(atPath: theme.path) {
        for file in files {
          stickerNames.append(theme.path + "/" + file)
        }
      }
    }
    return stickerNames
  }

  func image(from path: String) -> UIImage {
    UIImage(named: path)
      ?? UIImage(named: "error-image")
      ?? UIImage()
  }
}

struct StickerModal_Previews: PreviewProvider {
  static var previews: some View {
    StickerModal(stickerImage: .constant(UIImage()))
  }
}
