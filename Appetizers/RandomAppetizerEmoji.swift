//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Daniel Moura on 07/02/24.
//

import SwiftUI

class RandomAppetizerEmoji: ObservableObject {
    
    final var emojiList = ["🍤", "🍟", "🥓", "🍿", "🍗", "🍣", "🍕", "🍖", "🥗", "🌮"]
    
    @Published var emoji: String = "🍤"
    
    var timer: Timer?
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.refresh()
        })
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func refresh() {
        let lastEmoji = emoji
        while (emoji == lastEmoji) {
            emoji = self.emojiList.randomElement() ?? "🍤"
        }
    }
}
