//
//  HomeTabView.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import Foundation
import UIKit
import SnapKit

class LeaguesView: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubViews()
        setupConstraints()
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

//MARK: - AddSubViews
extension LeaguesView {
    func addSubViews() {
        addSubview(collectionView)
    }
}

//MARK: - SetupConstraints
extension LeaguesView {
    func setupConstraints() {
        collectionView.snp.makeConstraints() {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
