//
//  ResultsViewModel.swift
//  AppStore
//
//  Created by Pontius Pirat on 14.09.2021.
//

import Combine
import Foundation

class ResultsViewModel: ObservableObject {
    private(set) var groupResults = [[Result]]()
    private var cancellabel: Set<AnyCancellable> = []
    
    init() {
        fetchData()
        print("DEBUG INIT: Init ResultsViewModel")
    }
    
    func fetchData() {
        
        Publishers.CombineLatest3(NetworkAPI.shared.fetchResults(from: Endpoint.games)
                                    .map { $0.results },
                                  NetworkAPI.shared.fetchResults(from: Endpoint.social)
                                    .map { $0.results },
                                  NetworkAPI.shared.fetchResults(from: Endpoint.music)
                                    .map { $0.results })
            .map { (games, social, music) -> [[Result]] in
                let res = [games, social, music]
                return res
            }
            .assign(to: \.groupResults, on: self)
            .store(in: &cancellabel)
    }
}


