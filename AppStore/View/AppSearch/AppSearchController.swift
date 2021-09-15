//
//  AppSearchController.swift
//  AppStore
//
//  Created by Pontius Pirat on 22.08.2021.
//

import UIKit
import SDWebImage
import SwiftUI
import Combine

class AppSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate let cellId = UUID().uuidString
    @ObservedObject var searchViewModel = SearchViewModel()
    private var cancellabel: Set<AnyCancellable> = []
    private var refreshTimer: Timer?
    
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
        
        searchBarListener()
        
        collectionView.addSubview(startSearchTerm)
        startSearchTerm.fillSuperview(padding: .init(top: 200, left: 125, bottom: 0, right: 0))
        
    }
    
    fileprivate func setupSearchController() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func searchBarListener() {
        
        searchController.searchBar.searchTextField.textPublisher
            .print("LISTENER DEBUG text")
            .assign(to: \.searchTerm, on: searchViewModel)
            .store(in: &cancellabel)
        
        //kostyl
        refreshTimer?.invalidate()
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { _ in
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        startSearchTerm.isHidden = searchViewModel.searchResults.count != 0
        return searchViewModel.searchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = searchViewModel.searchResults[indexPath.item]
        return cell
    }
    
}
