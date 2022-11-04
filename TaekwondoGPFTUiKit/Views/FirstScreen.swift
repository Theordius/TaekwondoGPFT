//
//  ViewController.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import UIKit

class FirstScreen: UIViewController {
    
    let image = UIImage(named: "logo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        mainLogo()
    }
    
    func mainLogo() {
        let imageView = UIImageView(image: image!)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 125),
            imageView.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
    
}

