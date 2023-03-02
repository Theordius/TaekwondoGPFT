//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    //MARK: - PROPERTIES
    @State private var selection: String? = nil
    
    let haptics = UIImpactFeedbackGenerator()
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
                    Text("")
                    
                    CustomButton(title: "TEORIA", subtitle: "Teoria Taekwon - DO", tag: "A")
                    CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy Formalne", tag: "B")
                    CustomButton(title: "SKLEP ONLINE", subtitle: "Nasz sklep Online", tag: "C")
                    CustomButton(title: "KALENDARZ", subtitle: "Kalendarz Imprez", tag: "D")
                    
                    Spacer()
                }
               .padding(.vertical, -12)
               .buttonStyle(BlueCapsule())
               .frame(width: .infinity)
              
        
            }
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
