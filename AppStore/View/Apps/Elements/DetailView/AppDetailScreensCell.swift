//
//  AppDetailScreensCell.swift
//  AppStore
//
//  Created by Pontius Pirat on 15.10.2021.
//

import UIKit
import Kingfisher

class AppDetailScreensCell: UICollectionViewCell {
    
    var screenshoot = UIImageView(cornerRadius: 8, borderWidth: 0.5, borderColor: UIColor(white: 0.5, alpha: 0.5).cgColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screenshoot.backgroundColor = .systemTeal
        addSubview(screenshoot)
        screenshoot.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
