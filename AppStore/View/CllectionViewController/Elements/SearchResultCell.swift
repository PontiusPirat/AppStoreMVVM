//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 23.08.2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let iconImage = {
            self.createImage(appIconImage: UIImageView(),backgroundcolor: .red,
                                                    widthAnchor: 64, heightAnchor: 64, cornerRadius: 12)
        }()
        
        let getButton = {
            self.createButton(button: UIButton(), title: "GET", titleColor: .blue,
                                              fontSize: 14, backgroundcolor: .systemGray5, cornerRadius: 16,
                                              widthAnchor: 80, heightAnchor: 32)
        }()
        
        lazy var screenshoot1 = self.createImage(appIconImage: UIImageView(), backgroundcolor: .blue)
        lazy var screenshoot2 = self.createImage(appIconImage: UIImageView(), backgroundcolor: .blue)
        lazy var screenshoot3 = self.createImage(appIconImage: UIImageView(), backgroundcolor: .blue)
        
        
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
