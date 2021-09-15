//
//  BaseListController.swift
//  AppStore
//
//  Created by Pontius Pirat on 08.09.2021.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }   
}
