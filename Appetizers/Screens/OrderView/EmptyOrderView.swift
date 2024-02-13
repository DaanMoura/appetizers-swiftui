//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Daniel Moura on 12/02/24.
//

import SwiftUI

struct EmptyOrderView: View {
    var body: some View {
        VStack(spacing: 32) {
            Image("empty-order")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 220)
            
            Text("You have no items in your order 😭")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    EmptyOrderView()
}
