//
//  CollegeSearchView.swift
//  College Search TEST
//
//  Created by Delaney Blaszinski on 5/6/25.
//


import SwiftUI

struct CollegeSearchView: View {
    @State private var zipCode = "Enter zip code"
    @State private var selectedSizeRange = "1000-5000"
    @State private var selectedDistance = "50"
    
    private let sizeOptions: [String: (Int, Int)] = [
        "1000-5000": (1000, 5000),
        "5001-10000": (5001, 10000),
        "10001-15000": (10001, 15000),
        "15001-20000": (15001, 20000),
        "20001-25000": (20001, 25000),
        "25001-30000": (25001, 30000),
        "30001-35000": (30001, 35000),
        "35001-40000": (35001, 40000),
        "40001-45000": (40001, 45000)
    ]
    
    private let distanceOptions = ["50", "100", "150", "200", "250", "300", "350", "400", "450", "500", "600", "1000"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                TextField("Enter ZIP Code", text: $zipCode).font(Font.custom("Times New Roman", size: 30))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                Text("Select Number of Students:").font(Font.custom("Times New Roman", size: 30)).underline()
                Picker("Student Size Range", selection: $selectedSizeRange) {
                    ForEach(sizeOptions.keys.sorted(), id: \.self) { key in
                        Text(key)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
                Text("Select Distance:").font(Font.custom("Times New Roman", size: 30)).underline()
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
                        .font(Font.custom("Times New Roman", size: 30))
                    
                }
                .padding(.horizontal)
                Spacer()
            }
            .navigationTitle("College Search").font(Font.custom("Times New Roman", size: 30))
            .background(Color.pink.opacity(0.2))
        }
    }
}
#Preview  {
    CollegeSearchView()
}

