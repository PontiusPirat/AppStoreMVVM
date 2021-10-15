//
//  AppDetailScreensController.swift
//  AppStore
//
//  Created by Pontius Pirat on 15.10.2021.
//

import UIKit

class AppDetailScreensController: HorizontalSnapingController, UICollectionViewDelegateFlowLayout {
    
    private let screensCellId = UUID().uuidString
    
    var screens: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AppDetailScreensCell.self, forCellWithReuseIdentifier: screensCellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screens?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screensCellId, for: indexPath) as! AppDetailScreensCell
        if let screenshotUrl = URL(string: screens?[indexPath.item] ?? "") {
            cell.screenshoot.kf.setImage(with: screenshotUrl)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
}
