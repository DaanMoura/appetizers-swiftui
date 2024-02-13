//
//  AppetizerDetailsView.swift
//  Appetizers
//
//  Created by Daniel Moura on 11/02/24.
//

import SwiftUI

struct AppetizerDetailsView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(url: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .padding()
            
            Spacer()
            
            HStack(spacing: 32) {
                NutritionFactView(name: "Calories", value: "\(appetizer.calories)")
                NutritionFactView(name: "Carbs", value: "\(appetizer.carbs) g")
                NutritionFactView(name: "Protein", value: "\(appetizer.protein) g")
            }
            
            Spacer()
            
            APButton(text: "\(appetizer.price.asMoney) - Add to order") {
                order.add(appetizer)
                isShowingDetail = false
            }
            .padding()
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .shadow(color: .primary.opacity(0.3),radius: 40)
        .overlay(XDismissButton { isShowingDetail = false }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer, isShowingDetail: Binding.constant(true))
}

struct NutritionFactView: View {
    let name: String
    let value: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .font(.subheadline)
                .italic()
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
    }
}
