//
//  ViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 26. 10. 2021..
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
        self.view.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


