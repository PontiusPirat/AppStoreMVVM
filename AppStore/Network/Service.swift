//
//  Service.swift
//  AppStore
//
//  Created by Pontius Pirat on 07.09.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchGames(complition: @escaping ([Result], Error?) -> ()) {
        fetchApps(searchTerm: "games", completion: complition)
    }
    
    func fetchSocial(complition: @escaping ([Result], Error?) -> ()) {
        fetchApps(searchTerm: "social", completion: complition)
    }
    
    func fetchMusic(complition: @escaping ([Result], Error?) -> ()) {
        fetchApps(searchTerm: "music", completion: complition)
    }
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) -> Void {
        let urlString = Endpoint.search(searchTerm).path()
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            if let fetchErr = err {
                //print("Fetch error: ", fetchErr.localizedDescription)
                completion([], fetchErr)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completion(searchResult.results, nil)
                
            } catch let JsonErr {
                //print("Failed to decode data: ", JsonErr.localizedDescription)
                completion([], JsonErr)
            }
            
        }.resume()
    }
}
