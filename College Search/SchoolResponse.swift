
//
//  SchoolResponse.swift
//  College Search TEST
//
//  Created by Delaney Blaszinski on 5/6/25.
//

struct SchoolResponse: Codable {
    let results: [School]
}

struct School: Codable, Identifiable {
    let id: Int
    let name: String
    let city: String
    let state: String
    let zip: String
    let url: String?
    let size: Int?
// declaring variables, so that youre able to pick different categories for the colleges
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "school.name"
        case city = "school.city"
        case state = "school.state"
        case zip = "school.zip"
        case url = "school.url"
        case size = "2022.student.size"
    }
}
// these values are used in CollegeResultsView in order to pull the correct API


struct SchoolInfo: Codable {
    let city: String
    let state: String
    let zip: String
    let url: String?
}
// this allows the responses to be in the string format, declares school info
struct StudentInfo: Codable {
    let size: Int?
}
// allows the response to be in number format, declares student info
