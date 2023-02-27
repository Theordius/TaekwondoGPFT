//
//  TheoryDetailView.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 01/12/2022.
//

import UIKit

class TheoryDetailView: UIViewController {
    
    let viewModel = TheoryDetailsViewModel()
    let font = UIFont.boldSystemFont(ofSize: 18)
    
    var detailItem: Theory?
    var theoryDescription: UILabel!
    var theoryImage = UIImage(named: "logo")
    
    override func loadView() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineBreakStrategy = .standard
        paragraphStyle.headIndent = 2.0
        paragraphStyle.paragraphSpacing = 5.0
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .backgroundColor: UIColor.clear,
            .font: font,
            .baselineOffset: 5,
            .paragraphStyle: paragraphStyle
            
        ]
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
        
        title =  self.detailItem?.name
        navigationItem.largeTitleDisplayMode = .never
      
    }
}
