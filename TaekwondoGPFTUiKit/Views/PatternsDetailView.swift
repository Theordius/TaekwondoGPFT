//
//  PatternsDetailViewController.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 21/11/2022.
//

import UIKit

class PatternsDetailView: UIViewController {
    
    @IBOutlet var patternMovie: UIImageView!
    @IBOutlet var patternDescription: UILabel!
    
    
    var viewModel = PatternsDetailsViewModel()
    var detailItem: Patterns?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    
        title =  "TO JEST NAZWA UKŁADU"
        navigationItem.largeTitleDisplayMode = .never
       
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
