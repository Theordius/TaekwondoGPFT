//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct CustomButton: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel = ViewModel()
    @State private var selection: String? = nil
    
    var title: String
    var subtitle: String
    var tag: String
    
    //MARK: - BODY
    var body: some View {
        
        NavigationLink(destination: PatternsView(), tag: "A", selection: $selection) { EmptyView() }
        if let model = TheoryView.ViewModel() {
            NavigationLink(
                destination: TheoryView(viewModel: model),
                tag: "B",
                selection: $selection
            ) { EmptyView() }
        } else {
            NavigationLink(
                destination: EmptyView(),
                tag: "B",
                selection: $selection
            ) { EmptyView() }
        }
        
        NavigationLink(destination: WebView(viewModel: viewModel), tag: "C", selection: $selection) { EmptyView() }
        NavigationLink(destination: Text("Calendar"), tag: "D", selection: $selection) { EmptyView() }
        
        Button(action: {
            selection = tag
        }) {
            VStack(alignment: .center) {
                Text(title)
                   
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                Text(subtitle)
                   
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 200)
        } //: BUTTON
    }
}


//MARK: - PREVIEW
struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomButton(title: "UKŁADY FORMALNE", subtitle: "Układy formalne", tag: "A")
                .previewLayout(.sizeThatFits)
        }
    }
}
