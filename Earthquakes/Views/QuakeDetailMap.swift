//
//  QuakeDetailMap.swift
//  Earthquakes
//
//  Created by 강동영 on 10/29/24.
//

import SwiftUI
import MapKit

struct QuakeDetailMap: View {
    let location: QuakeLocation
    let tintColor: Color
    private let place: QuakePlace
    @State private var region = MKCoordinateRegion()
    
    init(location: QuakeLocation, tintColor: Color) {
        self.location = location
        self.tintColor = tintColor
        self.place = QuakePlace(location: location)
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                withAnimation {
                    region.center = place.location
                    region.span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                }
            }
        
    } 
}

struct QuakePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), location: QuakeLocation) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
