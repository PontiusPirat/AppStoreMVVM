//
//  APIConstatnts.swift
//  AppStore
//
//  Created by Pontius Pirat on 13.09.2021.
//

import Foundation

struct APIConstatnts {
    
    static let urlConstant: String = "https://itunes.apple.com/search?term="
    
    static let jsonDecoder: JSONDecoder = {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
            return jsonDecoder
        }()
}
