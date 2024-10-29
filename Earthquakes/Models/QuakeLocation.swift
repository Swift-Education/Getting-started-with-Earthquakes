//
//  QuakeLocation.swift
//  Earthquakes
//
//  Created by 강동영 on 10/22/24.
//

import Foundation

struct QuakeLocation: Decodable {
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longitude: Double { properties.products.origin.first!.properties.longitude }
    private var properties: RootProperties
    
    struct RootProperties: Decodable {
        let products: Products
    }
    struct Products: Decodable {
        let origin: [Origin]
    }
    struct Origin: Decodable {
        let properties: OriginProperties
    }
    struct OriginProperties {
        let latitude: Double
        let longitude: Double
    }
    
    init(latitude: Double, longitude: Double) {
        self.properties = RootProperties(products: Products(origin: [
            Origin(properties: OriginProperties(latitude: latitude, longitude: longitude))
        ]))
    }
}

extension QuakeLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
        let latitude = try container.decode(String.self, forKey: .latitude)
        let longitude = try container.decode(String.self, forKey: .longitude)
        
        guard let latitude = Double(latitude),
              let longitude = Double(longitude) else { throw QuakeError.missingData }
        self.latitude = latitude
        self.longitude = longitude
    }
}
