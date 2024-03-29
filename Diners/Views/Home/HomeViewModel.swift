//
//  HomeViewModel.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/26.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var searchQuery = "meat"
    @Published var businesses: [Business] = []
    @Published var selectedCategory: Price?
    @Published var selectedBusiness: Business?
    let priceCategories: [Price] = Price.allCases
    
    private let businessService: BusinessServiceType
    
    init(businessService: BusinessServiceType = BusinessService()) {
        self.businessService = businessService
    }
    
    func business(id: String) async throws -> Business {
        try await businessService.business(id: id)
    }
    
    func businesses(from query: String) async throws {
        businesses = try await businessService.businesses(from: query)
    }
    
    func showSection(for category: Price) -> Bool {
        !businesses.byPricing(category).isEmpty
    }
}
