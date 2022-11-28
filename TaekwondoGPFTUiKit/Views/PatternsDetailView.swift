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
        
        title =  "\(viewModel.patterns.self)"
        navigationItem.largeTitleDisplayMode = .never
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
