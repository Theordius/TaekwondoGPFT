//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CustomButton: View {
    //MARK: - PROPERTIES
    @State private var selection: String? = nil
    var title: String
    var subtitle: String
    var tag: String
    
    //MARK: - BODY
    var body: some View {
        
        NavigationLink(destination: TheoryView(), tag: "A", selection: $selection) {EmptyView()}
        NavigationLink(destination: PatternsView(), tag: "B", selection: $selection) { EmptyView() }
        NavigationLink(destination: Text("Sklep Online"), tag: "C", selection: $selection) { EmptyView() }
        NavigationLink(destination: Text("Kalendarz"), tag: "D", selection: $selection) { EmptyView() }
        
        Button(action: {
            selection = tag
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
        } //: BUTTON
    }
}


//MARK: - PREVIEW
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomButton(title: "TEORIA", subtitle: "Teoria Taekwon-do", tag: "A")
        }
    }
}
