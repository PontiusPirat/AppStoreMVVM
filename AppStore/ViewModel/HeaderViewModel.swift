//
//  HeaderViewModel.swift
//  AppStore
//
//  Created by Pontius Pirat on 10.09.2021.
//

import Foundation
import Combine

final class HeaderViewModel: ObservableObject {
    @Published private(set) var headers = [Header]()
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchData()
        print("DEBUG INIT: Init HeaderViewModel \(headers)")
    }
    
    func fetchData() {
        NetworkAPI.shared.fetchHeaders(from: .header)
            .assign(to: \.headers, on: self)
            .store(in: &self.cancellableSet)
    }
}
