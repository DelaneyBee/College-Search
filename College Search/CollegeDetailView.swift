//
//  CollegeDetailView.swift
//  College Search
//
//  Created by Delaney Blaszinski on 4/17/25.
//


import SwiftUI

struct CollegeDetailView: View {
    var college: College // Passed from InitialView

    var body: some View {
        VStack {
            Text(college.school.name)
                .font(.largeTitle)
                .padding()

            Text("Location: \(college.school.city), \(college.school.state)")
                .font(.title2)
                .padding()

            Spacer()
        }
        .navigationTitle("College Details")
    }
}

struct CollegeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CollegeDetailView(college: College(school: College.School(name: "Harvard University", city: "Cambridge", state: "MA")))
    }
}
