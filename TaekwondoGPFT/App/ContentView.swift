//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let haptics = UIImpactFeedbackGenerator()
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
            
            Group {
                Buttons(title: "TEORIA", subtitle: "Teoria Taekwond-DO", buttonImage: "logo")
                Buttons(title: "UKŁADY FORMALNE", subtitle: "Teoria Taekwond-DO", buttonImage: "logo")
                Buttons(title: "SKLEP - ONLINE", subtitle: "Teoria Taekwond-DO", buttonImage: "logo")
                Buttons(title: "KALENDARIUM", subtitle: "Teoria Taekwond-DO", buttonImage: "logo")
            }
            .padding(.vertical, 2)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
