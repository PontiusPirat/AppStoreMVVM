//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 23.08.2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let appNameLabel: UILabel = self.createAnyLabel(label: UILabel(), text: "APP NAME")
        let categoryLabel: UILabel = self.createAnyLabel(label: UILabel(), text: "Photo & Video")
        let ratingLabel: UILabel = self.createAnyLabel(label: UILabel(), text: "Rating")
        
        let labelStackView = UIStackView(arrangedSubviews: [appNameLabel, categoryLabel, ratingLabel])
        labelStackView.axis = .vertical
        
        
        let iconImage = self.createAppIconImage(appIconImage: UIImageView(),backgroundcolor: .red,
                                                widthAnchor: 64, heightAnchor: 64, cornerRadius: 12)
        
        let getButton = self.createButton(button: UIButton(), title: "GET", titleColor: .blue,
                                          fontSize: 14, backgroundcolor: .systemGray3, cornerRadius: 16,
                                          widthAnchor: 80, heightAnchor: 32)
        
        let stackView = UIStackView(arrangedSubviews: [iconImage, labelStackView, getButton])
        
        addSubview(stackView)
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
