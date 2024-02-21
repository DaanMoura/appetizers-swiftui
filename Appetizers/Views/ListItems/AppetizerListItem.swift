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
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .frame(width: 120, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(appetizer.price.asMoney)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
        .contentShape(Rectangle())
    }
    
}

#Preview {
    AppetizerListItem(appetizer: MockData.sampleAppetizer)
}
