//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 09.09.2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    var headerData: Header! {
        didSet {
            appTitle.text = headerData.name
            appDescription.text = headerData.tagline
            if let iconURL = URL(string: headerData.imageUrl) {
                print("IMAGE: \(iconURL)")
                appImage.sd_setImage(with: iconURL)
            } else {
                appImage.image = UIImage(systemName: "eye.slash")
            }
        }
    }
    
    var appTitle = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 12))
    var appDescription = UILabel(text: "App Description more text and other and other", font: .systemFont(ofSize: 20))
    var appImage = UIImageView(heightAnchor: 200, cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appTitle.textColor = .systemBlue
        appImage.backgroundColor = .systemTeal
        appDescription.numberOfLines = 2
        
        let verticalStack = CustomStackView(arrangedSubviews: [appTitle, appDescription, appImage], spacing: 10)
        addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
