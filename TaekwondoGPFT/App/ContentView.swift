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

            Group {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                
                Text("")
               
                CustomButton(title: "TEORIA", subtitle: "Teoria Taekwond-DO")
                CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy Formalne")
                CustomButton(title: "SKLEP - ONLINE", subtitle: "Nasz Sklep ON - LINE")
                CustomButton(title: "KALENDARIUM", subtitle: "Kalendarz Imprez")
                Spacer()
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
