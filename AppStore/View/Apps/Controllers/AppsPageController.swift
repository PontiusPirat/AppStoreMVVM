//
//  AppsController.swift
//  AppStore
//
//  Created by Pontius Pirat on 08.09.2021.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = UUID().uuidString
    private let headerId = UUID().uuidString
    private let groupNames = ["Games", "Social Networking", "Music"]
    
    var headerVM = HeaderViewModel()
    var groupResultsVM = ResultsViewModel()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
    }
    
    // MARK: - AppsPageHeader
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.horizontalHeaderController.headers = headerVM.headers
        DispatchQueue.main.async {
            header.horizontalHeaderController.collectionView.reloadData()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    // MARK: - AppsGroupCell
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupResultsVM.groupResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.titleLabel.text = groupNames[indexPath.item]
        cell.horizontalController.groupResults = groupResultsVM.groupResults[indexPath.item]
        
        cell.horizontalController.didSelectHandler = { [unowned self] app in
            let appController = AppDetailController()
            appController.app = app
            self.navigationController?.pushViewController(appController, animated: true)
        }
        
        DispatchQueue.main.async {
            cell.horizontalController.collectionView.reloadData()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
