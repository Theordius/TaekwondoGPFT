//
//  Logo.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 08/11/2022.
//

import Foundation
import UIKit

let logo = UIImage(named: "logo")

extension FirstScreen {
    
    func mainLogo() {
        let imageView = UIImageView(image: image!)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 175),
            imageView.heightAnchor.constraint(equalToConstant: 125),
            imageView.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
}
