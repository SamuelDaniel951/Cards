//
//  PreviewData.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

let initialCards: [Card] = [
  Card(backgroundColor: .yellow, elements: initialElements),
  Card(backgroundColor: .teal),
  Card(backgroundColor: .red),
  Card(backgroundColor: .purple),
  Card(backgroundColor: .orange)
]

let initialElements: [CardElement] = [
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 27, height: -140)),
    uiImage: UIImage(named: "giraffe3")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 380, height: 270),
      offset: CGSize(width: -80, height: 25)),
    uiImage: UIImage(named: "giraffe2")),
  ImageElement(
    transform: Transform(
      size: CGSize(width: 250, height: 180),
      offset: CGSize(width: 80, height: 205)),
    uiImage: UIImage(named: "giraffe1")),
  TextElement(
    transform: Transform(
      size: Settings.defaultElementSize * 1.1,
      offset: CGSize(width: 10, height: -275)),
    text: "Giraffes!!!",
    textColor: .black)
]

