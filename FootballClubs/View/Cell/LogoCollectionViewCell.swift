//
//  LogoCollectionViewCell.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import UIKit
import SnapKit

class LogoCollectionViewCell: UICollectionViewCell {
    static let identifier = "LogoCollectionViewCell"
    let clubNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    let clubLogoImage: UIImageView = {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        return logo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubViews()
        setupConstraints()
    }
    
    func configureCell(name: String, emblemUrl: String?) {
        clubNameLabel.text = name
        clubLogoImage.load(urlString: emblemUrl)
    }
}

//MARK: - AddSubViews
extension LogoCollectionViewCell {
    func addSubViews() {
        addSubview(clubNameLabel)
        addSubview(clubLogoImage)
    }
}

//MARK: - SetupConstrains
extension LogoCollectionViewCell {
    func setupConstraints() {
        setupLabelConstraints()
        setupImageConstraints()
    }
    
    func setupLabelConstraints() {
        clubNameLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview()
            $0.top.equalTo(clubLogoImage.snp.bottom)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
        }
    }
    
    func setupImageConstraints() {
        clubLogoImage.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalToSuperview().multipliedBy(0.67)
            $0.centerX.equalToSuperview()
        }
    }
}

extension UIImageView {
    func load(urlString : String?) {
        guard let urlString = urlString,
              let url = URL(string: urlString),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
                  return
              }
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
