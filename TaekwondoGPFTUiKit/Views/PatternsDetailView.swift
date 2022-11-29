//
//  PatternsDetailViewController.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import UIKit

class PatternsDetailView: UIViewController {
    
    var viewModel = PatternsDetailsViewModel()
    var detailItem: Patterns?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        title =  self.detailItem?.name
        navigationItem.largeTitleDisplayMode = .never
        
    }

}
