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
  var imageFilename: String?

  var image: Image {
    Image(
      uiImage: uiImage ??
        UIImage(named: "error-image") ??
        UIImage())
  }
}

// "" Codable support for ImageElement
extension ImageElement: Codable {
  enum CodingKeys: CodingKey {
    case transform, imageFilename, frameIndex
  }

  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    transform = try container
      .decode(Transform.self, forKey: .transform)
    frameIndex = try container
      .decodeIfPresent(Int.self, forKey: .frameIndex)
    imageFilename = try container.decodeIfPresent(
      String.self,
      forKey: .imageFilename)
    if let imageFilename {
      uiImage = UIImage.load(uuidString: imageFilename)
    } else {
      uiImage = UIImage.errorImage
    }
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(transform, forKey: .transform)
    try container.encode(frameIndex, forKey: .frameIndex)
    try container.encode(imageFilename, forKey: .imageFilename)
  }
}

struct TextElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var text = ""
  var textColor = Color.black
  var textFont = "Gill Sans"
}

// supporting code
extension TextElement: Codable {
  enum CodingKeys: CodingKey {
    case transform, text, textColor, textFont
  }

  init(from decoder: Decoder) throws {
    let container = try decoder
      .container(keyedBy: CodingKeys.self)
    transform = try container
      .decode(Transform.self, forKey: .transform)
    text = try container
      .decode(String.self, forKey: .text)
    let components = try container.decode([CGFloat].self, forKey: .textColor)
    textColor = Color.color(components: components)
    textFont = try container
      .decode(String.self, forKey: .textFont)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(transform, forKey: .transform)
    try container.encode(text, forKey: .text)
    let components = textColor.colorComponents()
    try container.encode(components, forKey: .textColor)
    try container.encode(textFont, forKey: .textFont)
  }
}
