//
//  Appetizer.swift
//  Appetizers
//
//  Created by Daniel Moura on 10/02/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 0,
        name: "Test Appetizer",
        description: "Test Description. Some text here.",
        price: 9.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
        calories: 90,
        protein: 99,
        carbs: 49
    )
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
