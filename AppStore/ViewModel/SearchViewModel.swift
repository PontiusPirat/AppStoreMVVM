//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Pontius Pirat on 15.09.2021.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var searchResults = [Result]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $searchTerm
            //.print("LISTENER DEBUG VM")
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { (searchTerm: String) -> AnyPublisher<SearchResult, Never> in
                MainAPI.shared.fetchResults(from: Endpoint.search(searchTerm))
            }
            //.print("LISTENER DEBUG Flat")
            .map { $0.results }
            .print("LISTENER DEBUG Map")
            .assign(to: \.searchResults, on: self)
            .store(in: &self.cancellableSet)
        print("LISTENER DEBUG SR: \(searchResults)")
    }
    
//    init() {
//        $searchTerm
//            .debounce(for: .milliseconds(100), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
//            .removeDuplicates()
//            .map({ (string) -> String? in
//                if string.count < 1 {
//                    self.searchResults = []
//                    return nil
//                }
//
//                return string
//            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
//            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
//            .sink { (_) in
//                //
//            } receiveValue: { [self] (searchField) in
//                searchItems(searchText: searchField)
//            }.store(in: &cancellabel)
//    }
//
//
//    private func searchItems(searchText: String) {
//
//        MainAPI.shared.fetchResults(from: Endpoint.search(searchText))
//            .receive(on: RunLoop.main)
//            .sink { (completed) in
//                //
//            } receiveValue: { [self] (searchedProducts) in
//                searchResults = searchedProducts.results
//            }.store(in: &cancellabel)
//    }
//
}

