//
//  SearchTabViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class SearchTabViewController: UIViewController {
    let searchTabView: SearchTabView = {
       let view = SearchTabView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = searchTabView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search"
        view.backgroundColor = .white
    }
}
