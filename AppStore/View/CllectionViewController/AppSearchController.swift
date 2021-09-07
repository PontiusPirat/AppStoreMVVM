//
//  AppSearchController.swift
//  AppStore
//
//  Created by Pontius Pirat on 22.08.2021.
//

import UIKit


class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = UUID().uuidString
    fileprivate var appSearchResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchSearchResults()
    }
    
    fileprivate func fetchSearchResults() {
        Service.shared.fetchApps { [unowned self] (results, err) in
            
            if let err = err {
                print("Fetching error: ", err.localizedDescription)
                return
            }
            
            self.appSearchResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        let appResult = appSearchResults[indexPath.item]
        cell.appNameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        if let rating = appResult.averageUserRating {
            let ratingDec = rating * 10
            cell.ratingLabel.text = "Rating: \(ratingDec.rounded() / 10)"
        } else {
            cell.ratingLabel.text = "Rating: 0"
        }
        
        return cell
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
