//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Pontius Pirat on 09.09.2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let horizontalHeaderController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(horizontalHeaderController.view)
        horizontalHeaderController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
