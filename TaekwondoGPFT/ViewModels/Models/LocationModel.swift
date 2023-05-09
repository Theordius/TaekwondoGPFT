//
//  LocationModel.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 17/03/2023.
//

import Foundation
import MapKit

struct SectionLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double

    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
