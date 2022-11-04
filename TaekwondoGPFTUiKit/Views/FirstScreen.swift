//
//  ViewController.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import UIKit

class FirstScreen: UIViewController {
    
    let image = UIImage(named: "logo")
    let theoryButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        mainLogo()
        title = "Wybierz"
        navigationController?.navigationBar.prefersLargeTitles = true
        theoryScreen()
    }
    
    func mainLogo() {
        let imageView = UIImageView(image: image!)
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 225),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func theoryScreen() {
        view.addSubview(theoryButton)
        
        theoryButton.configuration = .filled()
        theoryButton.configuration?.baseBackgroundColor = .systemBlue
        theoryButton.configuration?.title = "Teoria"
        
        theoryButton.addTarget(self, action: #selector(goToTheoryScreen), for: .touchUpInside)
        
        theoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            theoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            theoryButton.heightAnchor.constraint(equalToConstant: 50),
            theoryButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func goToTheoryScreen() {
        let theoryScreen = TheoryView()
        theoryScreen.title = "Teoria"
        navigationController?.pushViewController(theoryScreen, animated: true)
    }
    
}


