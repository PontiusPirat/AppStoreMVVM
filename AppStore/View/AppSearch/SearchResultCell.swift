//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 23.08.2021.
//

import UIKit
import Kingfisher

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
                iconImage.kf.setImage(with: iconURL)
            } else {
                iconImage.image = UIImage(systemName: "eye.slash")
            }
            
            screenshoot1.kf.setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenshoot2.kf.setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshoot3.kf.setImage(with: URL(string: appResult.screenshotUrls[2]))
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
    
    private let iconImage = UIImageView(widthAnchor: 64, heightAnchor: 64, cornerRadius: 12)
    
    private let getButton = UIButton(title: "GET", titleColor: .systemBlue, font: .boldSystemFont(ofSize: 14),
                             backgroundcolor: .systemGray5, cornerRadius: 16, widthAnchor: 80, heightAnchor: 32)
    
    private lazy var screenshoot1 = UIImageView(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    private lazy var screenshoot2 = UIImageView(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    private lazy var screenshoot3 = UIImageView(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    
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
