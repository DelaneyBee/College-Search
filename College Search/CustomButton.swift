//
//  CustomButton.swift
//  College Search
//
//  Created by Mia Anderson on 5/8/25.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var background: Color = .black
    var body: some View {
        Text(text)
            .foregroundColor(.pink)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(25)
    }
}

#Preview {
    CustomButton(text: "Find Colleges")
}
