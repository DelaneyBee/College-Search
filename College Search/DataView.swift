//
//  DataView.swift
//  College Search
//
//  Created by Delaney Blaszinski on 5/1/25.
//

import SwiftUI

struct DataView: View {
    @State private var colleges: [College] = []
    @State private var collegeSize = "1000-5000, 5001-10000, 10001-15000, 15001-20000"
    @State private var collegeDistance = "50, 100, 150, 200"
  @State private var isLoading = false
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

           
            let urlString = "https://api.data.gov/ed/collegescorecard/v1/schools?api_key=71h9fmGKhADcqWMzi49TwU3J9knDNWeL3itgHDAn&school.state=IL&zip=60010&distance=\(collegeDistance)&2022.student.size__\(collegeSize)"

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

