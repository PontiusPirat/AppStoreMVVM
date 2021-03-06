//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Pontius Pirat on 08.09.2021.
//

import UIKit

class AppsGruopHorizontalController: HorizontalSnapingController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = UUID().uuidString
    
    var groupResults: [Result]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var didSelectHandler: ((Result) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let app = groupResults?[indexPath.item] else { return }
        didSelectHandler?(app)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupResults?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsRowCell
        cell.fetchingResult = groupResults?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - (topButtonPadding + lineSpacing) * 2) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topButtonPadding, left: 0, bottom: topButtonPadding, right: 0)
    }
    
    // MARK: - Drawning constatns
    
    let topButtonPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
}
