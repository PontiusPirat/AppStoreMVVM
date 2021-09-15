//
//  Endpoint.swift
//  AppStore
//
//  Created by Pontius Pirat on 13.09.2021.
//

import Foundation

enum Endpoint {
    case header
    case search(_ searchTerm: String)
    case games
    case social
    case music
    
    func path() -> String {
        switch self {
        case .header:
            return "https://api.letsbuildthatapp.com/appstore/social"
        case .search(let searchTerm):
            return "\(APIConstatnts.urlConstant)\(searchTerm)&entity=software"
        case .games:
            return "\(APIConstatnts.urlConstant)games&entity=software"
        case .social:
            return "\(APIConstatnts.urlConstant)social&entity=software"
        case .music:
            return "\(APIConstatnts.urlConstant)music&entity=software"
        }
    }

}
