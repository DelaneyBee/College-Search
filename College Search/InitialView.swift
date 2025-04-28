//
//  InitialView.swift
//  College Search
//
//  Created by Samantha Hiles on 4/28/25.
//

import SwiftUI

struct InitialView: View {
    // State variables for each dropdown
    @State private var selectedSize = "0-1000"
    @State private var selectedDistance = "0-50"
    

    // Options for each dropdown
    let size = ["0-1000", "1001-5000", "5001-10000", "10001-25000", "250001-50000", "50000+"]
    let distance = ["0-50", "51-100", "101-200", "201-300","301-400"]


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select a Size")) {
                    Picker("Size", selection: $selectedSize) {
                        ForEach(size, id: \.self) { size in
                            Text(size)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Select a Distance")) {
                    Picker("Distance", selection: $selectedDistance) {
                        ForEach(distance, id: \.self) { distance in
                            Text(distance)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Filter Options")
        }
    }
}

struct MultiDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}


#Preview {
    InitialView()
}
