//
//  AppDetailScreens.swift
//  AppStore
//
//  Created by Pontius Pirat on 15.10.2021.
//

import UIKit

class AppDetailScreens: UICollectionViewCell {
    
    let horizontalScreensController = AppDetailScreensController()
    private let previewTitle = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewTitle)
        addSubview(horizontalScreensController.view)
        
        previewTitle.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        horizontalScreensController.view.anchor(top: previewTitle.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
