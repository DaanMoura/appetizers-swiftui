//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Daniel Moura on 10/02/24.
//

import SwiftUI

@ MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() async {
        isLoading = true
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
            isLoading = false
        } catch {
            isLoading = false
            if let error = error as? APError {
                switch error {
                case .invalidData: alertItem = AlertContext.invalidData
                case .invalidURL: alertItem = AlertContext.invalidURL
                case .invalidResponse: alertItem = AlertContext.invalidResponse
                case .unableToComplete: alertItem = AlertContext.unableToComplete
                }
            } else {
                alertItem = AlertContext.invalidResponse
            }
        }
    }
}
