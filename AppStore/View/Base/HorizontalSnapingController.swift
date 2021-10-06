//
//  HorizontalSnapingController.swift
//  AppStore
//
//  Created by Pontius Pirat on 06.10.2021.
//

import UIKit

class HorizontalSnapingController: UICollectionViewController {
    
    init() {
        let layout = SnappingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
