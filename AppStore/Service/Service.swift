//
//  Service.swift
//  AppStore
//
//  Created by Pontius Pirat on 07.09.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, complition: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            if let fetchErr = err {
                //print("Fetch error: ", fetchErr.localizedDescription)
                complition([], fetchErr)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                complition(searchResult.results, nil)
                
            } catch let JsonErr {
                //print("Failed to decode data: ", JsonErr.localizedDescription)
                complition([], JsonErr)
            }
            
        }.resume()
    }
}
