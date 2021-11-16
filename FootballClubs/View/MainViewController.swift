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
        
        let homeTabItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let searchTabItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let profileTabItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let settingsTabItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)

        homeTabVC.tabBarItem = homeTabItem
        searchTabVC.tabBarItem = searchTabItem
        profileTabVC.tabBarItem = profileTabItem
        settingsTabVC.tabBarItem = settingsTabItem
        
        mainTabBar.viewControllers = [homeTabVC,searchTabVC,profileTabVC,settingsTabVC]
        self.view.addSubview(mainTabBar.view)
    }
}
