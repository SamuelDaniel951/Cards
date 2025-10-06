//
//  ToolbarSelection.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import Foundation
enum ToolbarSelection: CaseIterable, Identifiable {
  var id: Int {
    hashValue
  }

  case photoModal, frameModal, stickerModal, textModal
}
