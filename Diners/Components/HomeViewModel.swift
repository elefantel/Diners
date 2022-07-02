//
//  HomeViewModel.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/26.
//

import Foundation

@MainActor
class HomeViewModel {
    private let businessService: BusinessServiceType
    
    init(businessService: BusinessServiceType = BusinessService()) {
        self.businessService = businessService
    }
    
    func business(id: String) async throws -> Business {
        try await businessService.business(id: id)
    }
    
    func businesses(from query: String = "meat") async throws -> [Business] {
        try await businessService.businesses(from: query)
    }
}
