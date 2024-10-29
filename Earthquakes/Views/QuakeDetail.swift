//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by 강동영 on 10/29/24.
//

import SwiftUI

struct QuakeDetail: View {
    var quake: Quake
    var body: some View {
        VStack {
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted())")
                .foregroundStyle(Color.secondary)
            if let location = quake.location {
                Text("Latitude: \(location.latitude)")
                Text("Longitude: \(location.longitude)")
            }
        }
    }
}

#Preview {
    QuakeDetail(quake: Quake.preview)
}
