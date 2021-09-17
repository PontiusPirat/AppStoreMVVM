//
//  MainAPI.swift
//  AppStore
//
//  Created by Pontius Pirat on 13.09.2021.
//

import Foundation
import Combine

class NetworkAPI {
    static let shared = NetworkAPI()
    
    // MARK: - Combine
    
    func fetch<T: Decodable>(url: String) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: T.self, decoder: APIConstatnts.jsonDecoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchHeaders(from endpoint: Endpoint) -> AnyPublisher<[Header], Never> {
        fetch(url: endpoint.path())
            .map { return $0 }
            .print("DEBUG HEADERS: ")
            .replaceError(with: [Header]())
            .eraseToAnyPublisher()
    }
    
    func fetchResults(from endpoint: Endpoint) -> AnyPublisher<SearchResult, Never> {
        fetch(url: endpoint.path())
            .map { return $0 }
            .print("DEBUG RESULTS: ")
            .replaceError(with: SearchResult(resultCount: 0, results: []))
            .eraseToAnyPublisher()
    }
    
    // MARK: - Rx + Alamo
    
    
}
