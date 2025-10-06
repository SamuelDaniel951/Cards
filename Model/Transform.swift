//
//  Transform.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI
//defines the position, size, and rotation of any element on the card
struct Transform {
    //width and height
  var size = CGSize(
    width: Settings.defaultElementSize.width,
    height: Settings.defaultElementSize.height)
    //rotations
  var rotation: Angle = .zero
  var offset: CGSize = .zero
}
