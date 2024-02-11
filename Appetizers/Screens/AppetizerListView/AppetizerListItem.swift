//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Daniel Moura on 10/02/24.
//

import SwiftUI

struct AppetizerListItem: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
            AppetizerRemoteImage(url: appetizer.imageURL)
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
            VStack(alignment: .leading, spacing: 8) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price.formatted(.currency(code: "")))")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    AppetizerListItem(appetizer: MockData.sampleAppetizer)
}
