//
//  Buttons.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 07/11/2022.
//  Buttons configuration model

import Foundation
import UIKit

let myButton1 = UIButton()
let myButton2 = UIButton()
let myButton3 = UIButton()
let myButton4 = UIButton()

let stackView = UIStackView(arrangedSubviews: [myButton1, myButton2, myButton3, myButton4])

/// Extention to UIViewController to configure reusable buttons
extension UIViewController {
    func buttonConfiguration(button: UIButton, config: UIButton.Configuration, title: String, subtitle: String, bgColor: UIColor, foregroundColor: UIColor) {
        let b = button
        b.configuration = config
        b.configuration?.title = title
        b.configuration?.titleAlignment = .center
        b.configuration?.subtitle = subtitle
        b.configuration?.baseForegroundColor = foregroundColor
        b.configuration?.baseBackgroundColor = bgColor
        b.configuration?.imagePlacement = .top
        b.configuration?.imagePadding = 6
        b.configuration?.cornerStyle = .large
    }
    
    func stackedButtonsView() {
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        stackView.heightAnchor.constraint(equalToConstant: 276),
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 80)
        
        ])
    }
}
