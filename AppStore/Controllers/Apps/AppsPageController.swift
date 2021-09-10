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
    private var fetchingResults = [[Result]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
       // fetchDataForGroup()
        fetchingWithGroup()
        
    }
    
    // MARK: - AppsPageHeader
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    // MARK: - AppsGroupCell
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchingResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        cell.titleLabel.text = groupNames[indexPath.item]
        cell.horizontalController.fetchingResults = fetchingResults[indexPath.item]
        cell.horizontalController.collectionView.reloadData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - Fetch Data
    
    private func fetchDataForGroup() {
        
        Service.shared.fetchGames() { [unowned self] (results, err) in
            
            if let err = err {
                print("Fetching error: ", err.localizedDescription)
                return
            }
            
            self.fetchingResults.append(results)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        Service.shared.fetchSocial { [unowned self] (results, err)  in
            if let err = err {
                print("Fetching error: ", err.localizedDescription)
                return
            }
            
            self.fetchingResults.append(results)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        Service.shared.fetchMusic { [unowned self] (results, err)  in
            if let err = err {
                print("Fetching error: ", err.localizedDescription)
                return
            }
            
            self.fetchingResults.append(results)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func fetchingWithGroup() {
        var gamesResult: [Result]?
        var socialResult: [Result]?
        var musicResult: [Result]?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { result, err in
            dispatchGroup.leave()
            gamesResult = result
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSocial { result, err in
            dispatchGroup.leave()
            socialResult = result
        }
        
        dispatchGroup.enter()
        Service.shared.fetchMusic { result, err in
            dispatchGroup.leave()
            musicResult = result
        }
        
        dispatchGroup.notify(queue: .main) {
            if let result = gamesResult {
                self.fetchingResults.append(result)
            }
            
            if let result = socialResult {
                self.fetchingResults.append(result)
            }
            
            if let result = musicResult {
                self.fetchingResults.append(result)
            }
            
            self.collectionView.reloadData()
        }
    }
}
