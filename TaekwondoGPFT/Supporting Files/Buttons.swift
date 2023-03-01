//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct Buttons: View {
    //MARK: - PROPERTIES
    var title: String
    var subtitle: String
    var buttonImage: String
    
    //MARK: - BODY
    var body: some View {
        Button(action: {
            print("Button 1")
        }) {
            VStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 8) {
                    VStack {
                        Text(subtitle)
                            .font(.footnote)
                            .fontWeight(.light)
                        Text("")
                        Image(systemName: buttonImage)
                            .imageScale(.large)
                    }
                    
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
             Capsule().strokeBorder(Color.blue, lineWidth: 1.25)
            )
           
        } //: BUTTON
        .accentColor(Color.blue)
        .background(Color.blue)
        .cornerRadius(16)
        .foregroundColor(.white)
     }
    
 }

//MARK: - PREVIEW
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(title: "TEORIA", subtitle: "Teoria Taekwon-do", buttonImage: "arrow.right.circle")
    }
}
