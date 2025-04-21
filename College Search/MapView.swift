//
//  MapView.swift
//  College Search
//
//  Created by Samantha Hiles on 4/21/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State private var startPosition = MapCameraPosition.userLocation(fallback: .automatic)
    

    var body: some View {
        Map(position: $startPosition) {
                    UserAnnotation()
                }

    }
}

#Preview {
    ContentView()
}
