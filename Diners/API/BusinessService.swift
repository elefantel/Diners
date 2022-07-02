//
//  BusinessService.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/26.
//

import Foundation

protocol BusinessServiceType: AnyObject  {
    init(network: any Networking)
    func business(id: String) async throws -> Business
    func businesses(from query: String) async throws -> [Business]
}

class BusinessService: BusinessServiceType {
    private let network: any Networking
    
    required init(network: any Networking = Network()) {
        self.network = network
    }
    
    func business(id: String) async throws -> Business {
        try await network.fetch(
            Business.self,
            endpoint: .business(id: id))
    }
    
    func businesses(from query: String) async throws -> [Business] {
        try await network.fetch(
            Businesses.self,
            endpoint: .businesses(query: query))
        .businesses
    }
}
