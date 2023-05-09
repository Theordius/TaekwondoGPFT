//
//  MapView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 51.9194, longitude: 19.1451)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 8.0, longitudeDelta: 8.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()

    let locations: [SectionLocation] = Bundle.main.decode("Locations.json")

    // MARK: - BODY

    var body: some View {
        // MARK: - ADVANCED MAP

        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.gray, .white]))
                .ignoresSafeArea()

            Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in

                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                } //: ANNOTATION
            }) //: MAP
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)

                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        Divider()

                        HStack {
                            Text("Longitude")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                } //: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),
                alignment: .top
            )
        }
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 13 Pro")
    }
}
