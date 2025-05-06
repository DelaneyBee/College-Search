//
//  ContentView.swift
//  Test
//
//  Created by Samantha Hiles on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory = "All"
    @State private var data: [String] = [] // Replace with your model
    let categories = ["All", "Books", "Movies", "Music"]

    var body: some View {
        VStack {
            Menu {
                ForEach(categories, id: \.self) { category in
                    Button(category) {
                        selectedCategory = category
                    }
                }
            } label: {
                Label("Category: \(selectedCategory)", systemImage: "chevron.down")
                    .padding()
            }

            List(data, id: \.self) { item in
                Text(item)
            }
        }
        .onChange(of: selectedCategory) { newCategory in
            loadData(for: newCategory)
        }
        .onAppear {
            loadData(for: selectedCategory)
        }
    }

    func loadData(for category: String) {
        // Mock API logic — replace with real calls
        switch category {
        case "Books":
            fetchBooks()
        case "Movies":
            fetchMovies()
        case "Music":
            fetchMusic()
        default:
            fetchAll()
        }
    }

    func fetchBooks() {
        // Simulate API call
        data = ["Book 1", "Book 2", "Book 3"]
    }

    func fetchMovies() {
        data = ["Movie A", "Movie B", "Movie C"]
    }

    func fetchMusic() {
        data = ["Song X", "Song Y", "Song Z"]
    }

    func fetchAll() {
        data = ["Book 1", "Movie A", "Song X"]
    }
}



#Preview {
    ContentView()
}
