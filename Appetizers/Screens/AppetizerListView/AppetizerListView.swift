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
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    Button {
                        viewModel.isShowingDetail = true
                        viewModel.selectedAppetizer = appetizer
                    } label: {
                        AppetizerListItem(appetizer: appetizer)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("\(randomAppetizerEmoji.emoji) Appetizers")
            }
            .disabled(viewModel.isShowingDetail)
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .ignoresSafeArea()
            .animation(.spring, value: viewModel.isShowingDetail)
            
            if viewModel.isShowingDetail {
                AppetizerDetailsView(appetizer: viewModel.selectedAppetizer!,
                                     isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
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
