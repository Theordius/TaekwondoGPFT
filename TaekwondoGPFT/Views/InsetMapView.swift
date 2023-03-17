//
//  InsetMapView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 17/03/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: - PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.9194, longitude: 19.1451), span: MKCoordinateSpan(latitudeDelta: 8.0, longitudeDelta: 8.0))
    
    //MARK: - BODY
    
    var body: some View {
       Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Nasze Sekcje")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } //: NAVIGATION
                    .padding(12)
                , alignment: .topTrailing
                
            
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

//MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
