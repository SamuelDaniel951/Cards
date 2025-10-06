//
//  CArd.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI
//card id
struct Card: Identifiable {
    //This lets you do ForEach(cards) safely without having to assign manual IDs.
    let id = UUID()
    var backgroundColor: Color = .yellow
    //store card elemnts
    var elements: [CardElement] = []
    //add sticker or image to card
    mutating func addElement(uiImage: UIImage) {
      let element = ImageElement(uiImage: uiImage)
      elements.append(element)
    }
  }

