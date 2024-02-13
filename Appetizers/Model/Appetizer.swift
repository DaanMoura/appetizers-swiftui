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
    
    static let orderItemOne = Appetizer(
        id: 0,
        name: "Test Appetizer One",
        description: "Test Description. Some text here.",
        price: 9.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
        calories: 90,
        protein: 99,
        carbs: 49
    )
    
    static let orderItemTwo = Appetizer(
        id: 1,
        name: "Test Appetizer Two",
        description: "Test Description. Some text here.",
        price: 9.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
        calories: 90,
        protein: 99,
        carbs: 49
    )
    
    static let orderItemThree = Appetizer(
        id: 2,
        name: "Test Appetizer Three",
        description: "Test Description. Some text here.",
        price: 9.99,
        imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
        calories: 90,
        protein: 99,
        carbs: 49
    )
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
