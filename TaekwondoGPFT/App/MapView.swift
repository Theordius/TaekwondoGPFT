//
//  MapView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.gray, .white]))
                .ignoresSafeArea()
            Text("NASZE ODDZIAŁY")
            
        }
     
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
