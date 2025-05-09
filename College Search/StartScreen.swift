//
//  StartScreen.swift
//  College Search
//
//  Created by Mia Anderson on 5/8/25.
//

import SwiftUI
//this view is for the first screen
struct WelcomeView: View {
    var body: some View {
        NavigationView {
            // This makes the screen able to move from one view to another
            VStack {
                VStack {
                   
                    Image("Pretty College")
                        .padding()
                    // Adds the image to the top of the screen
                }
                Text("Welcome to College Search").font(Font.custom("Times New Roman", size: 30)).foregroundColor(.pink).underline()
                    .padding()
                // First set of text with the modifiers to Font, Style, and Color
                Text("Find colleges based on size and distance!").font(Font.custom("Times New Roman", size: 25)).foregroundColor(.pink).multilineTextAlignment(.center)
                    .padding(90)
                //Second Set of text with the modifiers to Font, Style, and Color
                NavigationLink(destination: CollegeSearchView()) {
                    //Makes the button actually go to the next screen
                   
                    Text("Start Search").font(Font.custom("Times New Roman", size: 30))
                        .font(.headline)
                        .padding()
                        .background(Color.pink)
                    //Color of the button
                        .foregroundColor(.white)
                    //COlor of the text
                        .cornerRadius(20)
                        .padding(0)
                    // Modifiers to the button and its text
                }
                Spacer()
            }
        }
    }
}
#Preview {
    WelcomeView()
}
