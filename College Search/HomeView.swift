//
//  HomeView.swift
//  College Search
//
//  Created by Delaney Blaszinski on 4/17/25.
//


import SwiftUI

struct HomeView: View {
    @State private var colleges: [College] = [] // Array of colleges
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: fetchColleges) {
                    Text("Load 10 Colleges in IL")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                if isLoading {
                    ProgressView()
                        .padding()
                }

                List(colleges) { college in
                    NavigationLink(
                        destination: CollegeDetailView(college: college),
                        label: {
                            Text(college.school.name) // Display college name
                        }
                    )
                }
            }
            .navigationTitle("Colleges in IL")
        }
    }

    func fetchColleges() {
        Task {
            isLoading = true
            defer { isLoading = false }

            // Updated API URL for colleges in Illinois (10 per page)
            let urlString = "https://api.data.gov/ed/collegescorecard/v1/schools?api_key=71h9fmGKhADcqWMzi49TwU3J9knDNWeL3itgHDAn&school.state=IL&page=1&per_page=10"
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }

            do {
                // Perform the API request
                let (data, response) = try await URLSession.shared.data(from: url)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("HTTP status: \(httpResponse.statusCode)")
                    
                    // Handle non-200 HTTP responses
                    if httpResponse.statusCode != 200 {
                        print("Error: Received non-200 HTTP response.")
                        return
                    }
                }

                // Decode the response into APIResponse model
                let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
                colleges = Array(decoded.results.shuffled().prefix(10)) // Get 10 random colleges

            } catch {
                // Log any decoding or networking errors
                print("Error: \(error)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
