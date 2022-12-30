//
//  TheoryDetailView.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import UIKit

class TheoryDetailView: UIViewController {
    
    var viewModel = TheoryDetailsViewModel()
    var detailItem: Theory?
    var theoryDescription: UILabel!
    var theoryImage = UIImage(named: "logo")
   
    
    
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.systemGreen,
        .backgroundColor: UIColor.clear,
        .font: UIFont.italicSystemFont(ofSize: 18),
        .baselineOffset: 5,
    ]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        let theoryImage = UIImageView(image: theoryImage!)
        let description = NSAttributedString(string: (detailItem?.description)!, attributes: attributes)
        
        theoryImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(theoryImage)
        
        theoryDescription = UILabel(frame: CGRect(x: 0, y: 0, width: 220, height: 220))
        theoryDescription.translatesAutoresizingMaskIntoConstraints = false
        theoryDescription.numberOfLines = 0
        theoryDescription.attributedText = description
        theoryDescription.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(theoryDescription)
        
        NSLayoutConstraint.activate([
            
            theoryImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theoryImage.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            theoryImage.heightAnchor.constraint(equalToConstant: 125),
            theoryImage.widthAnchor.constraint(equalToConstant: 125),
            
            theoryDescription.topAnchor.constraint(equalTo: theoryImage.bottomAnchor, constant: 20),
            theoryDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theoryDescription.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            theoryDescription.widthAnchor.constraint(equalToConstant: 280),
            theoryDescription.heightAnchor.constraint(equalToConstant: 280)
        ])
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
}
