//
//  InitialView.swift
//  College Search
//
//  Created by Samantha Hiles on 4/28/25.
//

import SwiftUI

struct ButtonDropdownView: View {
    @State private var showSizeOptions = false
    @State private var showDistanceOptions = false
   

    @State private var selectedSize = "Size"
    @State private var selectedDistance = "Distance"
   

    let size = ["0-1000", "1001-5000", "5001-10000", "10001-25000", "25001-50000", "50001+"]
    let distance = ["0-25 miles", "26-50 miles", "51-100 miles", "101-200 miles", "201-500 miles", "501+ miles"]
   

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Fruit Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showSizeOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedSize)
                            Spacer()
                            Image(systemName: showSizeOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }

                    if showSizeOptions {
                        ForEach(size, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                                showSizeOptions = false
                            }) {
                                Text(size)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }

                // Color Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showDistanceOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedDistance)
                            Spacer()
                            Image(systemName: showDistanceOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }

                    if showDistanceOptions {
                        ForEach(distance, id: \.self) { distance in
                            Button(action: {
                                selectedDistance = distance
                                showDistanceOptions = false
                            }) {
                                Text(distance)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }

                // Animal Dropdown
               

                Spacer()
            }
            .padding()
            .navigationTitle("College Filters")
        }
    }
}

struct ButtonDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDropdownView()
    }
}
