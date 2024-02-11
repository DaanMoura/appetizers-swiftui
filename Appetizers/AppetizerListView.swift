//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Daniel Moura on 06/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var randomAppetizerEmoji = RandomAppetizerEmoji()
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListItem(appetizer: appetizer)
                }
                .listStyle(.plain)
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .navigationTitle("\(randomAppetizerEmoji.emoji) Appetizers")
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
