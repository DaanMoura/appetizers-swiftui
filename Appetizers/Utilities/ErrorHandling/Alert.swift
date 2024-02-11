//
//  Alert.swift
//  Appetizers
//
//  Created by Daniel Moura on 10/02/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: Network
    static let invalidData      = AlertItem(title:   Text("Server error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    
    static let invalidResponse  = AlertItem(title:   Text("Server error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidURL       = AlertItem(title:   Text("Server error"),
                                            message: Text("There was an issue connecting to the server. Please contact support."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title:   Text("Server error"),
                                            message: Text("Unable to complete your request. Please check your internet connection."),
                                            dismissButton: .default(Text("Ok")))
    
    //MARK: Form
    static let invalidForm      = AlertItem(title:  Text("Invalid form"),
                                            message: Text("Please ensure all fields in the form have been filled out."),
                                            dismissButton: .default(Text("Ok")))
    
    static let invalidEmail     = AlertItem(title:  Text("Invalid email"),
                                            message: Text("Please ensure your email is correct."),
                                            dismissButton: .default(Text("Ok")))
}
