//
//  CardElement.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI
//common requirements that all element types must share.A unique id (so SwiftUI can track it)A transform (so the app knows how to draw, move, or scale it on the card)
protocol CardElement {
  var id: UUID { get }
  var transform: Transform { get set }
}

//find elements on card
extension CardElement {
  func index(in array: [CardElement]) -> Int? {
    array.firstIndex { $0.id == id }
  }
}

struct ImageElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var frameIndex: Int?
  var uiImage: UIImage?

  var image: Image {
    Image(
      uiImage: uiImage ??
        UIImage(named: "error-image") ??
        UIImage())
  }
}

struct TextElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var text = ""
  var textColor = Color.black
  var textFont = "Gill Sans"
}
