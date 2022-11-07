//
//  Buttons.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 07/11/2022.
//

import Foundation
import UIKit

let myButton1 = UIButton()
let myButton2 = UIButton()
let myButton3 = UIButton()
let myButton4 = UIButton()

extension UIViewController {
    func buttonConfiguration(button: UIButton, config: UIButton.Configuration, title: String, subtitle: String, bgColor: UIColor, foregroundColor: UIColor, imageSystemName: String, imageTintColor: UIColor) {
        let b = button
        b.configuration = config
        b.configuration?.title = title
        b.configuration?.titleAlignment = .center
        b.configuration?.subtitle = subtitle
        b.configuration?.baseForegroundColor = foregroundColor
        b.configuration?.baseBackgroundColor = bgColor
        b.configuration?.image = UIImage(systemName: imageSystemName)?.withTintColor(imageTintColor, renderingMode: .alwaysOriginal)
        b.configuration?.imagePlacement = .top
        b.configuration?.imagePadding = 6
        b.configuration?.cornerStyle = .large
    }
}
