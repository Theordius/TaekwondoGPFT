//
//  OnlieShopView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 09/11/2022.
//

import SwiftUI
import WebKit

import SwiftUI

struct OnlineShopView: View {
    //MARK: - PROPERTIES
    @StateObject var vm = Self.ViewModel()
    
    //MARK: - BODY
    var body: some View {
           
        Text("Sklep Online")
    }
}

//MARK: - PREVIEW
struct OnlineShopView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineShopView()
    }
}
