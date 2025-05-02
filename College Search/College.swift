//
//  College.swift
//  College Search
//
//  Created by Delaney Blaszinski on 4/17/25.
//

import Foundation


struct College: Identifiable, Codable {
    let id = UUID() // Unique ID for SwiftUI List
    let school: School

    struct School: Codable {
        let name: String
        let city: String
        let state: String
    }
}

// API Response Model (contains the array of colleges)
struct APIResponse: Codable {
    let results: [College] // This holds the array of colleges from the API
}
