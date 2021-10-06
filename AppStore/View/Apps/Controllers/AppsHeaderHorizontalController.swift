//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Pontius Pirat on 09.09.2021.
//

import UIKit
import Kingfisher

class AppsHeaderHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = UUID().uuidString
    var headers = [Header]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    // MARK: - Cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        cell.appTitle.text = headers[indexPath.item].name
        cell.appDescription.text = headers[indexPath.item].tagline
        cell.appImage.kf.setImage(with: URL(string: headers[indexPath.item].imageUrl))
        return cell
    }
}
