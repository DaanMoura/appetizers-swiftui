//
//  APButton.swift
//  Appetizers
//
//  Created by Daniel Moura on 11/02/24.
//

import SwiftUI

struct APButton: View {
    let text: LocalizedStringKey
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text(text)
                .fontWeight(.bold)
                .frame(width: 244, height: 32)
        }
        .buttonStyle(.borderedProminent)
        .tint(.brandPrimary.opacity(0.8))
    }
}

#Preview {
    APButton(text: "Test Button", onTap: {})
}
