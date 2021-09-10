//
//  SearchResultModel.swift
//  AppStore
//
//  Created by Pontius Pirat on 25.08.2021.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String] // screenshots
    let artworkUrl100: String // app icon
    let sellerName: String
}
