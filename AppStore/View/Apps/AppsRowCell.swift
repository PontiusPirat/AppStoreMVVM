//
//  AppsRowCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 08.09.2021.
//

import UIKit

class AppsRowCell: UICollectionViewCell {
    
    let iconImage = UIImageView(widthAnchor: 64, heightAnchor: 64, cornerRadius: 12)
    
    let titleLabael = UILabel(text: "App title", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 12))
    
    let getButton = UIButton(title: "GET", titleColor: .systemBlue, font: .boldSystemFont(ofSize: 14),
                             backgroundcolor: .systemGray5, cornerRadius: 16, widthAnchor: 80, heightAnchor: 32)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImage.backgroundColor = .systemTeal
        
        let horizontalStack = CustomStackView(arrangedSubviews: [iconImage,
                                                                 CustomStackView(arrangedSubviews: [titleLabael, companyLabel], spacing: 4),
                                                                 getButton],
                                              spacing: 16, alignment: .center, axis: .horizontal, distribution: .fill)
        addSubview(horizontalStack)
        horizontalStack.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
