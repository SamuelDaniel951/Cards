//
//  TextExtensions.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

//resizing text
extension Text {
  func scalableText(font: Font = Font.system(size: 1000)) -> some View {
    self
      .font(font)
      .minimumScaleFactor(0.01)
      .lineLimit(1)
  }
}
