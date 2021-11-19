//
//  HomeTabViewController.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit

class ClubsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var clubs: [Team] = []
    var league: League?
    
    let homeTabView: ClubsView = {
        let view = ClubsView()
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
        navigationItem.title = league?.name ?? ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDataFromAPI()
    }
    
    private func getDataFromAPI() {
        guard let id = league?.id else { return }
        homeTabView.toggleAnimation(animate: true)
        NetworkManager.shared.getTeams(competitionId: id) { result in
            switch result {
            case .success(let teams):
                self.clubs = teams
                self.homeTabView.reload()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.homeTabView.toggleAnimation(animate: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogoCollectionViewCell.identifier, for: indexPath) as? LogoCollectionViewCell
        else { return UICollectionViewCell() }
        let team = clubs[indexPath.row]
        cell.configureCell(name: team.name, emblemUrl: team.crestUrl)
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
}
