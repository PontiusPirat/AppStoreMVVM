//
//  AppSearchController.swift
//  AppStore
//
//  Created by Pontius Pirat on 22.08.2021.
//

import UIKit

class AppSearchController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .red
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
