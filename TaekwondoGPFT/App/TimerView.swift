//
//  TimerView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.gray, .white]))
                .ignoresSafeArea()
            Text("SEKUNDNIK")
            
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
