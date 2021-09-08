//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 23.08.2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
            appNameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            if let rating = appResult.averageUserRating {
                let ratingDec = rating * 10
                ratingLabel.text = "Rating: \(ratingDec.rounded() / 10)"
            } else {
                ratingLabel.text = "Rating: 0"
            }
            
            if let iconURL = URL(string: appResult.artworkUrl100) {
                iconImage.sd_setImage(with: iconURL)
            } else {
                iconImage.image = UIImage(systemName: "eye.slash")
            }
            
            screenshoot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1 {
                screenshoot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2 {
                screenshoot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appNameLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let categoryLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let ratingLabel: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    let iconImage: UIImageView = {
        let img = UIImageView()
        img.widthAnchor.constraint(equalToConstant: 64).isActive = true
        img.heightAnchor.constraint(equalToConstant: 64).isActive = true
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        return img
    }()
    
    let getButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("GET", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = .systemGray5
        btn.layer.cornerRadius = 16
        btn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return btn
    }()
    
    lazy var screenshoot1 = self.createImage(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    lazy var screenshoot2 = self.createImage(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    lazy var screenshoot3 = self.createImage(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = CustomStackView(arrangedSubviews: [appNameLabel, categoryLabel, ratingLabel])
        
        let infoTopStackView = CustomStackView(arrangedSubviews: [iconImage, labelStackView, getButton], spacing: 12,
                                               alignment: .center, axis: .horizontal)
        
        let screenshotsStackView = CustomStackView(arrangedSubviews: [screenshoot1, screenshoot2, screenshoot3],
                                                   spacing: 12, axis: .horizontal, distribution: .fillEqually)

        let overallStackView = CustomStackView(arrangedSubviews: [infoTopStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
