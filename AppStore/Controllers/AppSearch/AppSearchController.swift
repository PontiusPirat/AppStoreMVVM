//
//  AppSearchController.swift
//  AppStore
//
//  Created by Pontius Pirat on 22.08.2021.
//

import UIKit
import SDWebImage

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellId = UUID().uuidString
    fileprivate var appSearchResults = [Result]()
    fileprivate var timer: Timer?
    
    fileprivate let startSearchTerm: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please search..."
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .light)
        lbl.textColor = .systemGray2
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        setupSearchController()
        
        collectionView.addSubview(startSearchTerm)
        startSearchTerm.fillSuperview(padding: .init(top: 200, left: 125, bottom: 0, right: 0))
        
        //fetchSearchResults()
    }
    
    fileprivate func setupSearchController() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            Service.shared.fetchApps(searchTerm: searchText) { [unowned self] res, err in
                
                if let err = err {
                    print("Fetching error: ", err.localizedDescription)
                    return
                }
                
                self.appSearchResults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    fileprivate func fetchSearchResults() {
        Service.shared.fetchApps(searchTerm: "twitter") { [unowned self] (results, err) in
            
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
        startSearchTerm.isHidden = appSearchResults.count != 0
        return appSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = appSearchResults[indexPath.item]

        return cell
    }
    
}
