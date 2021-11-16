//
//  HomeTabViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class LeaguesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var leagues: [League] = []
    
    let homeTabView: LeaguesView = {
        let view = LeaguesView()
        view.collectionView.register(LogoCollectionViewCell.self, forCellWithReuseIdentifier: LogoCollectionViewCell.identifier)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeTabView
        homeTabView.collectionView.delegate = self
        homeTabView.collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDataFromAPI()
    }
    
    private func getDataFromAPI() {
        NetworkManager.shared.getLeagues { result in
            switch result {
            case .success(let leagues):
                self.leagues = leagues
                self.homeTabView.reload()
            case .failure(let error):
                debugPrint("Error: ", error.localizedDescription)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoCollectionViewCell.identifier, for: indexPath) as? LogoCollectionViewCell
        else { return UICollectionViewCell() }
        let competition = leagues[indexPath.row]
        cell.configureCell(name: competition.name, emblemUrl: competition.emblemUrl)
        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3)-4,
                      height: (view.frame.size.width/2)-4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clubsVC = ClubsViewController()
        let league = leagues[indexPath.row]
        clubsVC.league = league
        navigationController?.pushViewController(clubsVC, animated: true)
    }
}
