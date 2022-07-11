//
//  HomeViewModel.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/26.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var searchQuery = ""
    @Published var businesses: [Business] = []
    @Published var selectedCategory: Price?
    @Published var selectedBusiness: Business?
    
    let priceCategories: [Price] = Price.allCases
    let columns = Array(repeating: GridItem(.adaptive(minimum: 180)), count: 2)
    
    private let businessService: BusinessServiceType
    
    init(businessService: BusinessServiceType = BusinessService(),
         selectedCategory: Price? = nil) {
        self.businessService = businessService
        self.selectedCategory = selectedCategory
    }
    
    func fetchBusinesses() {
        Task.init {
            do {
                try await businesses()
            } catch {
                print(error)
            }
        }
    }
    
    func business(id: String) async throws -> Business {
        try await businessService.business(id: id)
    }
    
    func businesses(from query: String = "meat") async throws {
        businesses = try await businessService.businesses(from: query)
    }
    
    func showSection(for category: Price) -> Bool {
        !businesses.byPricing(category).isEmpty
    }
}
