//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CustomButton: View {
    //MARK: - PROPERTIES
    var title: String
    var subtitle: String
    
    //MARK: - BODY
    var body: some View {
        Button(action: {
            print("Button 1")
        }) {
                VStack(alignment: .center) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        
                    Text(subtitle)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
            }
            
            .padding(.vertical, 2)
            .frame(width: 280, height: 48)

            
        } //: BUTTON
        .background(Color.blue)
        .cornerRadius(12)
      
      
    }
}



//MARK: - PREVIEW
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "TEORIA", subtitle: "Teoria Taekwon-do")
    }
}
