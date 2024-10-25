//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by 강동영 on 10/22/24.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
