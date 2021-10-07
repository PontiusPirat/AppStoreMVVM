//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 07.10.2021.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    // MARK: - Зачем инитить все тут, если можно в конструкторе? На "подумать"
    
    let appImage = UIImageView(widthAnchor: 120 , heightAnchor: 120, cornerRadius: 16)
    let appName = UILabel(text: "AppName", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let appWhatsNew = UILabel(text: "Whats New?", font: .boldSystemFont(ofSize: 20))
    let appPriceButton = UIButton(title: "Price", titleColor: .white, font: .systemFont(ofSize: 20), backgroundcolor: .systemBlue, cornerRadius: 16, widthAnchor: 80, heightAnchor: 32)
    let appReleaseNote = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    //var app: Result?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        appImage.backgroundColor = .systemTeal
        
        let headStackView = CustomStackView(arrangedSubviews: [appImage, CustomStackView(arrangedSubviews: [appName, appPriceButton], spacing: 12)],
                                            spacing: 20,
                                            axis: .horizontal)
        
        let stackView = CustomStackView(arrangedSubviews: [headStackView, appWhatsNew, appReleaseNote],
                                        spacing: 16,
                                        alignment: .leading)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
