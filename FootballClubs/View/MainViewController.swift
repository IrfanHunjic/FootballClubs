//
//  MainViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    let mainTabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        configureTabs()
    }

    
    func configureTabs() {
        let navigationController = UINavigationController(rootViewController: LeaguesViewController())
        let homeTabVC = navigationController
        let searchTabVC = SearchTabViewController()
        let profileTabVC = ProfileTabViewController()
        let settingsTabVC = SettingsTabViewController()
        
        let homeTabItem = UITabBarItem(title: "Leagues", image: #imageLiteral(resourceName: "arsenal"), tag: 0)
        let searchTabItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        let profileTabItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        let settingsTabItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle.fill"), tag: 2)

        homeTabVC.tabBarItem = homeTabItem
        searchTabVC.tabBarItem = searchTabItem
        profileTabVC.tabBarItem = profileTabItem
        settingsTabVC.tabBarItem = settingsTabItem
        
        mainTabBar.viewControllers = [homeTabVC,searchTabVC,profileTabVC,settingsTabVC]
        self.view.addSubview(mainTabBar.view)
    }
}
