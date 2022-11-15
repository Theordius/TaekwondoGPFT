//
//  PatternsView.swift
//  TaekwondoGPFTUiKit
//
//  Created by Rafał Gęsior on 07/11/2022.
//

import UIKit

class PatternsView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = PatternsViewModel()
    let tableView = UITableView()
    var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        backgroundConfiguration.backgroundColor = .systemGray6
        backgroundConfiguration.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        backgroundConfiguration.cornerRadius = 5
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.patterns.count
    }
    
    //MARK: - Table View Delegates
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.patterns[indexPath.row].name
        cell.backgroundConfiguration = backgroundConfiguration
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("The cell \(indexPath.row) was tapped")
    }
}


