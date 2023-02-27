//
//  TheoryView.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 04/11/2022.
//

import UIKit

class TheoryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = TheoryViewModel()
    let tableView = UITableView()
    var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "theory")
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
        return viewModel.theory.count
    }
    
    //MARK: - Table View Delegates
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theory", for: indexPath)
        let theory = viewModel.theory[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.textLabel?.text = theory.name
        cell.backgroundConfiguration = backgroundConfiguration
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TheoryDetailView()
        vc.detailItem = viewModel.theory[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        }
    }
