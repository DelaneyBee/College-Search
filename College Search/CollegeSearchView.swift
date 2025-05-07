//
//  CollegeSearchView.swift
//  College Search TEST
//
//  Created by Delaney Blaszinski on 5/6/25.
//


import SwiftUI

struct CollegeSearchView: View {
    @State private var zipCode = "60010"
    @State private var selectedSizeRange = "1000-5000"
    @State private var selectedDistance = "50"
    
    private let sizeOptions: [String: (Int, Int)] = [
        "1000-5000": (1000, 5000),
        "5001-10000": (5001, 10000),
        "10001-15000": (10001, 15000),
        "15001-20000": (15001, 20000)
    ]
    
    private let distanceOptions = ["50", "100", "150", "200"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("Enter ZIP Code", text: $zipCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Picker("Student Size Range", selection: $selectedSizeRange) {
                    ForEach(sizeOptions.keys.sorted(), id: \.self) { key in
                        Text(key)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)

                Picker("Distance (mi)", selection: $selectedDistance) {
                    ForEach(distanceOptions, id: \.self) { dist in
                        Text("\(dist) miles")
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)

                NavigationLink(destination: CollegeResultsView(
                    zip: zipCode,
                    distance: selectedDistance,
                    minSize: sizeOptions[selectedSizeRange]?.0 ?? 1000,
                    maxSize: sizeOptions[selectedSizeRange]?.1 ?? 5000
                )) {
                    Text("Load Colleges")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("College Search")
        }
    }
}

