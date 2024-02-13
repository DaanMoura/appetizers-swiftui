//
//  OrderView.swift
//  Appetizers
//
//  Created by Daniel Moura on 06/02/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListItem(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    APButton(text: "\(order.totalPrice.asMoney) - Place order", onTap: {
                        print("place order")
                    })
                    .padding(.bottom, 12)
                }
                
                if order.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order 😭\nAdd an appetizer!")
                }
            }
            .navigationTitle("📝 Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
