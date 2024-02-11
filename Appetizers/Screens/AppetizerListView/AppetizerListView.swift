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
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    Button {
                        isShowingDetail = true
                        selectedAppetizer = appetizer
                    } label: {
                        AppetizerListItem(appetizer: appetizer)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("\(randomAppetizerEmoji.emoji) Appetizers")
            }
            .disabled(isShowingDetail)
            .blur(radius: isShowingDetail ? 20 : 0)    
            .ignoresSafeArea()
            .animation(.spring, value: isShowingDetail)
            
            if isShowingDetail {
                AppetizerDetailsView(appetizer: selectedAppetizer!, 
                                     isShowingDetail: $isShowingDetail)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: isShowingDetail)
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
