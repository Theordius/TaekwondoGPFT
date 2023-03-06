//
//  ContentView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 27/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.gray, .white]))
                    .ignoresSafeArea()
                VStack {
                    Group {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                        
                        Text("")
                        
                        CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy Formalne", tag: "A")
                        CustomButton(title: "TEORIA", subtitle: "Teoria Taekwon - DO", tag: "B")
                        CustomButton(title: "SKLEP ONLINE", subtitle: "Nasz sklep Online", tag: "C")
                        CustomButton(title: "KALENDARZ", subtitle: "Kalendarz Imprez", tag: "D")
                        
                        Spacer()
                    }
                    
                    .padding(.vertical, -12)
                    .buttonStyle(BlueCapsule())
                    
                    
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
