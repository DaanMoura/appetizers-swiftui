//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Daniel Moura on 11/02/24.
//

import SwiftUI

struct XDismissButton: View {
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color(.systemBackground))
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .foregroundStyle(.foreground)
                    .frame(width: 44, height: 44)
            }
        }
    }
}

#Preview {
    XDismissButton(onTap: {})
}
