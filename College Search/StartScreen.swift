//
//  StartScreen.swift
//  College Search
//
//  Created by Mia Anderson on 5/8/25.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to College Search!")
                .font(.largeTitle)
            Image("Pretty college").resizable().frame(width: 200, height: 200)
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
        Spacer()
    }
}

#Preview {
    StartScreen()
}
