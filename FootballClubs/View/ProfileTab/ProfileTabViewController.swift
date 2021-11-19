//
//  ProfileTabViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class ProfileTabViewController: UIViewController {
    let profileTabView: ProfileTabView = {
       let view = ProfileTabView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = profileTabView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .white
    }
}
