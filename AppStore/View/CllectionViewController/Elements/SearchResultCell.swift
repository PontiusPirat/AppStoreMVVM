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
        
        backgroundColor = .systemGray6
        
        let labelStackView = UIStackView(arrangedSubviews: [createAnyLabel(label: UILabel(), text: "APP NAME"),
                                                            createAnyLabel(label: UILabel(), text: "Photo & Video"),
                                                            createAnyLabel(label: UILabel(), text: "Rating")
                                                           ])
        labelStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [createAppIconImage(appIconImage: UIImageView(),backgroundcolor: .red,
                                                                          widthAnchor: 64, heightAnchor: 64, cornerRadius: 12),
                                                       labelStackView,
                                                       createButton(button: UIButton(), title: "GET", titleColor: .blue,
                                                                    fontSize: 14, backgroundcolor: .systemGray3, cornerRadius: 16,
                                                                    widthAnchor: 80, heightAnchor: 32)])
        addSubview(stackView)
        stackView.alignment = .center
        stackView.spacing = 12
        
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
