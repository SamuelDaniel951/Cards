//
//  CardsApp.swift
//  Cards
//
//  Created by owner on 10/5/25.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject var store = CardStore(defaultData: true)

  var body: some Scene {
    WindowGroup {
      CardsListView()
        .environmentObject(store)
    }
  }
}
