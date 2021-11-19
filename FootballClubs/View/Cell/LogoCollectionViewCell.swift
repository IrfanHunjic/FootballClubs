//
//  LogoCollectionViewCell.swift
//  FootballClubs
//
//  Created by Emir Vajzović on 28. 10. 2021..
//

import UIKit
import SnapKit
import SVGKit

class LogoCollectionViewCell: UICollectionViewCell {
    static let identifier = "LogoCollectionViewCell"
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()
    
    let logoImage: UIImageView = {
        let logo = UIImageView()
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        return logo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 15
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
        nameLabel.text = name
        if let image = UIImage.getImage(from: emblemUrl) {
            logoImage.image = image
        } else {
            logoImage.image = #imageLiteral(resourceName: "blankEmblem")
        }
    }
}

//MARK: - AddSubViews
extension LogoCollectionViewCell {
    func addSubViews() {
        addSubview(nameLabel)
        addSubview(logoImage)
    }
}

//MARK: - SetupConstrains
extension LogoCollectionViewCell {
    func setupConstraints() {
        setupLabelConstraints()
        setupImageConstraints()
    }
    
    func setupLabelConstraints() {
        nameLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview()
            $0.top.equalTo(logoImage.snp.bottom)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
        }
    }
    
    func setupImageConstraints() {
        logoImage.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.height.equalToSuperview().multipliedBy(0.67)
            $0.centerX.equalToSuperview()
        }
    }
}

extension UIImage {
    static func getImage(from urlString: String?) -> UIImage? {
        guard
            let urlString = urlString,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url)
        else { return nil }
        if let receivedImage = SVGKImage(data: data) {
            return receivedImage.uiImage
        } else if let image = UIImage(data: data) {
            return image
        }
        
        return nil
    }
}
