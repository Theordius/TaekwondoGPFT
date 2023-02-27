//
//  ViewController.swift
//  TaekwondoGPFT
//
//  Created by Rafał Gęsior on 28/09/2022.
//

import UIKit

class FirstScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        mainLogo()
        stackedButtonsView()
        
        buttonConfiguration(button: myButton1, config: .filled(), title: "TEORIA", subtitle: "Teoria Taekwon - do", bgColor: .blue, foregroundColor: .white)
        myButton1.addTarget(self, action: #selector(goToTheoryScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton2, config: .filled(), title: "UKŁADY FORMALNE", subtitle: "Układy formalne", bgColor: .blue, foregroundColor: .white)
        myButton2.addTarget(self, action: #selector(goToPatternsScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton3, config: .filled(), title: "WYDARZENIA", subtitle: "Kalendarium wydarzeń", bgColor: .blue, foregroundColor: .white)
        myButton3.addTarget(self, action: #selector(goToCalendarScreen), for: .touchUpInside)
        
        buttonConfiguration(button: myButton4, config: .filled(), title: "SKLEP ONLINE", subtitle: "Nasz sklep online", bgColor: .blue, foregroundColor: .white)
        myButton4.addTarget(self, action: #selector(goToShopOnlineScreen), for: .touchUpInside)
        
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
        let shopOnlineScreen = OnlineShopView()
        shopOnlineScreen.title = "SklepOnline"
        navigationController?.pushViewController(shopOnlineScreen, animated: true)
        
    }
}
