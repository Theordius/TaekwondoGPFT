//
//  WebView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 03/04/2023.
//

import SwiftUI

struct WebView: View {
    //MARK: - PROPERTIES
    @ObservedObject var viewModel = ViewModel()
    @State var showLoader = false
    @State var webTitle = ""
    
    //MARK: - BODY

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text(webTitle).font(.subheadline).onReceive(self.viewModel.showWebTitle.receive(on: RunLoop.main)) { value in
                    self.webTitle = value
                }
                
                /* This is our WebView. Here if you pass .localUrl it will load LocalWebsite.html file
                 into the WebView and if you pass .publicUrl it will load the public website depending on
                 your url provided. See WebView implementation for more info. */
                OnlineShopView(url: .publicUrl, viewModel: viewModel)
                
               
            }.onReceive(self.viewModel.showLoader.receive(on: RunLoop.main)) { value in
                self.showLoader = value
            }
            
            // A simple loader that is shown when WebView is loading any page and hides when loading is finished.
            if showLoader {
               ProgressBar()
                    .frame(width: 200, height: 200)
                   
            }
        }
    }
}

//MARK: - PREVIEW
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}