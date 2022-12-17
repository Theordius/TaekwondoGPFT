//
//  PatternsDetailViewController.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import UIKit
import AVKit

class PatternsDetailView: UIViewController {
    
    var viewModel = PatternsDetailsViewModel()
    var detailItem: Patterns?
    var patternMovie = UIImage(named: "logo")
    var patternImages = [UIImage]()
    var patternDescription: UILabel!
    
    let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.systemGreen,
        .backgroundColor: UIColor.clear,
        .font: UIFont.italicSystemFont(ofSize: 18),
        .baselineOffset: 5,
    ]
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        let patternMovieView = UIImageView(image: patternMovie!)
        let description = NSAttributedString(string: (detailItem?.description)!, attributes: attributes)
        
        patternMovieView.translatesAutoresizingMaskIntoConstraints = false
        patternMovieView.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(patternMovieView)
        
        patternDescription = UILabel(frame: CGRect(x: 0, y: 0, width: 220, height: 220))
        patternDescription.translatesAutoresizingMaskIntoConstraints = false
        patternDescription.numberOfLines = 0
        patternDescription.attributedText = description
        patternDescription.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        view.addSubview(patternDescription)
        
        NSLayoutConstraint.activate([
            
            patternMovieView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            patternMovieView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            patternMovieView.heightAnchor.constraint(equalToConstant: 125),
            patternMovieView.widthAnchor.constraint(equalToConstant: 125),
            
            patternDescription.topAnchor.constraint(equalTo: patternMovieView.bottomAnchor, constant: 20),
            patternDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            patternDescription.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            patternDescription.widthAnchor.constraint(equalToConstant: 280),
            patternDescription.heightAnchor.constraint(equalToConstant: 280)
        ])
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title =  self.detailItem?.name
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
}
