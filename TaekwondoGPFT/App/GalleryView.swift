//
//  GalleryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedImage: String = "tkd-02"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let gallery: [Gallery] = Bundle.main.decode("Gallery.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                //MARK: - IMAGE
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                //MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(gallery) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedImage = item.image
                                haptics.impactOccurred()
                            }
                       
                    } //: LOOP
                  
                } //: GRID
                CreditsView().opacity(0.6)
                    
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                  
                })
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
        .background(Color.black)
     
    }
       
}

//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .previewDevice("iPhone 11 Pro")
    }
}
