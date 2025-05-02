//
//  InitialView.swift
//  College Search
//
//  Created by Samantha Hiles on 4/28/25.
//

import SwiftUI

struct ButtonDropdownView: View {
    @State private var showSizeOptions = false
    @State private var showDistanceOptions = false
    @State private var selectedSize = "Size"
    @State private var selectedDistance = "Distance"
   @StateObject var gameManger = GameManger()

    let size = ["0-1000 students", "1001-5000 students", "5001-10000 students", "10001-25000 students", "25001-50000 students", "50001+ students"]
    let distance = ["0-25 miles", "26-50 miles", "51-100 miles", "101-200 miles", "201-500 miles", "501+ miles"]
   

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Fruit Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showSizeOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedSize)
                            Spacer()
                            Image(systemName: showSizeOptions ? "chevron.up" : "chevron.down")
                        }
                        .padding()
                        .background(Color(.pink))
                        .cornerRadius(20).shadow(radius: 10)
                        .foregroundColor(.white)
                    }
                    if showSizeOptions {
                        ForEach(size, id: \.self) { size in
                            Button(action: {
                                selectedSize = size
                                showSizeOptions = false
                            }) {
                                Text(size)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading).bold()
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
                
                // Color Dropdown
                VStack(alignment: .leading) {
                    Button(action: {
                        showDistanceOptions.toggle()
                    }) {
                        HStack {
                            Text(selectedDistance)
                            Spacer()
                            Image(systemName: showDistanceOptions ? "chevron.up" : "chevron.down")
                        }
                        
                        .padding()
                        .background(Color(.pink))
                        .cornerRadius(20).shadow(radius: 10)
                        .foregroundColor(.white)
                    }
                    
                    if showDistanceOptions {
                        ForEach(distance, id: \.self) { distance in
                            Button(action: {
                                selectedDistance = distance
                                showDistanceOptions = false
                            }) {
                                Text(distance)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading).bold()
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
              
                
                NavigationLink { //got the button to work with the dataView struct
                    DataView()
                        .environmentObject(gameManger)
                } label: {
                    CustomButton(text: "Load")
                }
                
                Spacer()
                    .navigationTitle("College Search")
                  
            }

            .font(Font.custom("Times New Roman", size: 18))
            .background(Color.pink).opacity((0.6))

        }
       
        
    }
   
}


struct ButtonDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDropdownView()
    }
}
