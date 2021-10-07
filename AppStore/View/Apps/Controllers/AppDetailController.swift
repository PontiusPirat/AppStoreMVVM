//
//  AppDetailController.swift
//  AppStore
//
//  Created by Pontius Pirat on 07.10.2021.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var app: Result?
    
    private let detailCellId = UUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
        //cell.app = app
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
