//
//  CustomButton.swift
//  College Search
//
//  Created by Mia Anderson on 5/8/25.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var background: Color = .pink
    var body: some View {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(background)
                .cornerRadius(25)
                .font(Font.custom("Times New Roman", size: 30))
        
    }
}
