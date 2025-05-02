//
//  ButtonView.swift
//  College Search
//
//  Created by Delaney Blaszinski on 5/1/25.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var text: String
    var background: Color = .pink
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 20)
            .background(background)
            .cornerRadius(20)
            .shadow(radius: 10)
            .font(Font.custom("Times New Roman", size: 18))
        
    }
}
#Preview {
    CustomButton(text: "Load ")
}
