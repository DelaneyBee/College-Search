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
            VStack {
                VStack {
                   
                    Image("Pretty College")
                        .padding()
                }
                Text("Welcome to College Search").font(Font.custom("Times New Roman", size: 30)).foregroundColor(.pink).underline()
                    .padding()
                Text("Find colleges based on size and distance!").font(Font.custom("Times New Roman", size: 25)).foregroundColor(.pink).multilineTextAlignment(.center)
                    .padding(90)
                NavigationLink(destination: CollegeSearchView()) {
                   
                    Text("Start Search").font(Font.custom("Times New Roman", size: 30))
                        .font(.headline)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(0)
                }
                Spacer()
            }
          
        }
      
    }
}
#Preview {
    WelcomeView()
}
