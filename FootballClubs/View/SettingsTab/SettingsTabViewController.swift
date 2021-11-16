//
//  SettingsTabViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class SettingsTabViewController: UIViewController {
    let settingsTabView: SettingsTabView = {
       let view = SettingsTabView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = settingsTabView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        view.backgroundColor = .white
    }
}
