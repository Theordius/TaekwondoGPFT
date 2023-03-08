//
//  TimerView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 01/03/2023.
//

import SwiftUI

struct TimerView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.scenePhase) var scenePhase
    @State private var timeRemaining = 100
    @State private var isActive = true
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.gray, .white]))
                .ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                
                Divider().padding(.vertical, 4)
                Text("CZAS: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                
        
                Button("Start Again", action: resetTimer)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                Divider().padding(.vertical, 5)
                
            }
            .onReceive(timer) { time in
                guard isActive else { return }
                
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    isActive = true
                } else {
                    isActive = false
                }
            }
        }
            
    }
    //MARK: - FUNCTIONS
    func resetTimer() {
        timeRemaining = 100
        isActive = true
    }
}


  

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
