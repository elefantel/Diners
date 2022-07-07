//
//  Network.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import SwiftUI

protocol Networking: ObservableObject {
    func fetch<T: Decodable>(_ Type: T.Type, endpoint: Endpoint) async throws -> T
}

class Network: Networking {
    // Don't do this in real life!!! Only meant for the movies!
    private let apiKey = "ATPEh592ywOElt6rDUT-n2sQYaCe-R5amR8tRXTi6vsedHwf5cJAhSz12DqVgkO9Az_4kYeUnQKqiC2Daq9WE_yNLVxbDPtMq_KCuW7d3kKjqI1zg8dOIzTI-dCwYnYx"
    
    func fetch<T: Decodable>(_ Type: T.Type, endpoint: Endpoint) async throws -> T {
        guard let url = URL(string: url(for: endpoint)) else {
            throw DinersError.invalidUrl
        }
        let request = request(for: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Type, from: data)
        return response
    }
    
    private func request(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField: "Authorization")
        return request
    }
    
    private func url(for endpoint: Endpoint) -> String {
        endpoint.url
    }
}
