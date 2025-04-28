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
    @State private var selectedColor = "Red"
    @State private var selectedAnimal = "Dog"

    // Options for each dropdown
    let size = ["0-1000", "1001-5000", "5001-10000", "10001-25000", "250001-50000", "50000+"]
    let colors = ["Red", "Blue", "Green", "Yellow"]
    let animals = ["Dog", "Cat", "Rabbit", "Bird"]

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

                Section(header: Text("Select a Color")) {
                    Picker("State", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text("Select an Animal")) {
                    Picker("Animal", selection: $selectedAnimal) {
                        ForEach(animals, id: \.self) { animal in
                            Text(animal)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Multi Dropdowns")
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
