//
//  EmptyState.swift
//  Appetizers
//
//  Created by Daniel Moura on 12/02/24.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 220)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Example message")
}
