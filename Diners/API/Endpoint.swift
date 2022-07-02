//
//  Endpoint.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import Foundation

enum Endpoint {
    case business(id: String)
    case businesses(query: String)
    
    var limit: Int { 50 }
    var location: String { "San Jose" }
    
    var url: String {

        switch self {
        case .businesses(let query):
            return url(with: "/search",
                queryParamaters: ["term": query])
        case .business(let id):
            return url(queryParamaters: ["id": id])
        }
    }
    
    func url(with path: String? = nil,
             queryParamaters: [String: String]) -> String {
        
        var components = URLComponents()
        let baseUrl = "https://api.yelp.com/v3/businesses"
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in queryParamaters {
            queryItems.append(
                URLQueryItem(name: key, value: value))
        }
        queryItems.append(contentsOf: [
            URLQueryItem(name: "limit", value: String(limit)),
            URLQueryItem(name: "location", value: location)
        ])
        
        components.queryItems = queryItems
        
        let url = components
            .url?
            .absoluteString ?? ""
        
        return baseUrl
            .appending(path ?? "")
            .appending(url)
    }
}
