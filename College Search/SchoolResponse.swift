
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


struct SchoolInfo: Codable {
    let city: String
    let state: String
    let zip: String
    let url: String?
}

struct StudentInfo: Codable {
    let size: Int?
}
