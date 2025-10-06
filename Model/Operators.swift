//
//  Operators.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI
// math helpers
//used for easier code writing by defining math operations 
func + (left: CGSize, right: CGSize) -> CGSize {
  CGSize(
    width: left.width + right.width,
    height: left.height + right.height)
}

func * (left: CGSize, right: CGFloat) -> CGSize {
  CGSize(
    width: left.width * right,
    height: left.height * right)
}

func *= (left: inout CGSize, right: Double) {
  left = CGSize(
    width: left.width * right,
    height: left.height * right)
}

func / (left: CGSize, right: CGFloat) -> CGSize {
  CGSize(
    width: left.width / right,
    height: left.height / right)
}
