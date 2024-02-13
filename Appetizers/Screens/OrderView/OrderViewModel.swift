//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Daniel Moura on 12/02/24.
//

import SwiftUI

class OrderViewModel: ObservableObject {
    @Published var orders: [Appetizer] = MockData.orders
    
    var totalPrice: Double {
        orders.reduce(0, { $0 + $1.price })
    }
    
    var isEmpty: Bool {
        orders.isEmpty
    }
    
    func add(_ appetizer: Appetizer) {
        orders.append(appetizer)
    }
    
    func deleteItem (at offsets: IndexSet) {
        orders.remove(atOffsets: offsets)
    }
}
