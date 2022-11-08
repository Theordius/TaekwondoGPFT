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
    let stackView = UIStackView(arrangedSubviews: [myButton1, myButton2, myButton3, myButton4])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        mainLogo()
        stackedButtonsView()

        buttonConfiguration(button: myButton1, config: .filled(), title: "TEORIA", subtitle: "Teoria Taekwon - do ", bgColor: .blue, foregroundColor: .white)
        myButton1.addTarget(self, action: #selector(goToTheoryScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton2, config: .filled(), title: "UKŁADY FORMALNE", subtitle: "Układy formalne", bgColor: .blue, foregroundColor: .white)
        myButton2.addTarget(self, action: #selector(goToPatternsScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton3, config: .filled(), title: "WYDARZENIA", subtitle: "Kalendarium wydarzeń", bgColor: .blue, foregroundColor: .white)
        myButton3.addTarget(self, action: #selector(goToCalendarScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton4, config: .filled(), title: "SKLEP ONLINE", subtitle: "Nasz sklep online", bgColor: .blue, foregroundColor: .white)
        myButton4.addTarget(self, action: #selector(goToShopOnlineScreen), for: .touchUpInside)
        
    }
    
    func stackedButtonsView() {
        
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 276).isActive = true // 84(height of single button) * 4(number of buttons) = 336 + 36(total stackView spaces from buttons) = 372(height of intere stackView)
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true // set width of button
    }
    
    //MARK: - Basic Navigation
    
    @objc func goToTheoryScreen() {
        let theoryScreen = TheoryView()
        theoryScreen.title = "Teoria"
        navigationController?.pushViewController(theoryScreen, animated: true)
    }
    
    @objc func goToPatternsScreen() {
        let patternsScreen = PatternsView()
        patternsScreen.title = "Układy formalne"
        navigationController?.pushViewController(patternsScreen, animated: true)
    }
    
    @objc func goToCalendarScreen() {
        let calendarScreen = CalendarView()
        calendarScreen.title = "Kalendarium"
        navigationController?.pushViewController(calendarScreen, animated: true)
    }
    
    @objc func goToShopOnlineScreen() {
        let shopOnlineScreen = ShopOnlineView()
        shopOnlineScreen.title = "SklepOnline"
        navigationController?.pushViewController(shopOnlineScreen, animated: true)
        
    }
}


