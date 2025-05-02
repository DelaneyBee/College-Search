//
//  DataView.swift
//  College Search
//
//  Created by Delaney Blaszinski on 5/1/25.
//

import SwiftUI

struct DataView: View {
    @State private var colleges: [College] = []
    @State private var isLoading = false
    @State private var totalPages = 17 // Estimated max pages; can be made dynamic later
    @EnvironmentObject var gameManger: GameManger

    var body: some View {
        NavigationView {
            VStack {
                Button(action: fetchColleges) {
                    Text("Load")
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
                            Text(college.school.name)
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

            let randomPage = Int.random(in: 1...totalPages)
            let urlString = "https://api.data.gov/ed/collegescorecard/v1/schools?api_key=71h9fmGKhADcqWMzi49TwU3J9knDNWeL3itgHDAn&school.state=IL&page=\(randomPage)&per_page=10"

            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }

            do {
                let (data, response) = try await URLSession.shared.data(from: url)

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("Error: Received non-200 HTTP response.")
                    return
                }

                let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
                colleges = decoded.results // Display fresh 10 from random page

            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
#Preview {
    DataView()
}

