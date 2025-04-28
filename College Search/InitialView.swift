//
//  InitialView.swift
//  College Search
//
//  Created by Samantha Hiles on 4/28/25.
//

import SwiftUI

struct ButtonDropdownView: View {
    @State private var showFruitOptions = false
    @State private var showColorOptions = false
    @State private var showAnimalOptions = false

    @State private var selectedFruit = "Apple"
    @State private var selectedColor = "Red"
    @State private var selectedAnimal = "Dog"

    let fruits = ["Apple", "Banana", "Orange", "Grapes"]
    let colors = ["Red", "Blue", "Green", "Yellow"]
    let animals = ["Dog", "Cat", "Rabbit", "Bird"]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Fruit Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showFruitOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedFruit)
                            Spacer()
                            Image(systemName: showFruitOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }

                    if showFruitOptions {
                        ForEach(fruits, id: \.self) { fruit in
                            Button(action: {
                                selectedFruit = fruit
                                showFruitOptions = false
                            }) {
                                Text(fruit)
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
                        showColorOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedColor)
                            Spacer()
                            Image(systemName: showColorOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }

                    if showColorOptions {
                        ForEach(colors, id: \.self) { color in
                            Button(action: {
                                selectedColor = color
                                showColorOptions = false
                            }) {
                                Text(color)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }

                // Animal Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showAnimalOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedAnimal)
                            Spacer()
                            Image(systemName: showAnimalOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    }

                    if showAnimalOptions {
                        ForEach(animals, id: \.self) { animal in
                            Button(action: {
                                selectedAnimal = animal
                                showAnimalOptions = false
                            }) {
                                Text(animal)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Button Dropdowns")
        }
    }
}

struct ButtonDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDropdownView()
    }
}
