//
//  CollegeResultsView.swift
//  College Search TEST
//
//  Created by Delaney Blaszinski on 5/6/25.
//


import SwiftUI

struct CollegeResultsView: View {
    let zip: String
    let distance: String
    let minSize: Int
    let maxSize: Int

    @State private var schools: [School] = []

    var body: some View {
        List(schools, id: \.id) { school in
            VStack(alignment: .leading) {
                Text(school.name).font(.headline)
                Text("\(school.city), \(school.state) \(school.zip)")
                if let size = school.size {
                    Text("Size: \(size)")
                }
                if let url = school.url {
                    Text(url).foregroundColor(.blue)
                }
            }
        }
        .navigationTitle("Colleges")
        .onAppear {
            fetchColleges()
        }
    }

    func fetchColleges() {
        let apiKey = "71h9fmGKhADcqWMzi49TwU3J9knDNWeL3itgHDAn"
        let baseURL = "https://api.data.gov/ed/collegescorecard/v1/schools"
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "zip", value: zip),
            URLQueryItem(name: "distance", value: "\(distance)mi"),
            URLQueryItem(name: "2022.student.size__range", value: "\(minSize)..\(maxSize)"),
            URLQueryItem(name: "fields", value: "id,school.name,school.city,school.state,school.zip,school.url,2022.student.size")
        ]

        guard let url = components.url else {
            print("❌ Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("❌ No data")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(SchoolResponse.self, from: data)
                DispatchQueue.main.async {
                    self.schools = decoded.results
                }
            } catch {
                print("❌ Decoding error: \(error)")
            }
        }.resume()
    }
}

