//
//  HomeView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.priceCategories) { priceCategory in
                if viewModel.showSection(for: priceCategory) {
                    NavigationLink(priceCategory.title, value: priceCategory)
                }
            }
            .padding(.horizontal, -16)
            .scrollIndicators(.hidden)
            .navigationTitle("Categories")
            .onAppear {
                Task.init {
                    do {
                        try await viewModel.businesses()
                    } catch {
                        print(error)
                    }
                }
            }
            .navigationDestination(for: Price.self) { category in
                BusinessesView(viewModel: BusinessesViewModel(
                    businesses: viewModel.businesses.byPricing(category)))
                    .navigationTitle(category.title)
                    .onAppear { viewModel.selectedCategory = category }
            }
            .navigationDestination(for: Business.self) { business in
                BusinessDetailView(viewModel: BusinessDetailViewModel(
                    businesses: viewModel.businesses.byPricing(viewModel.selectedCategory),
                    business: business))
            }
        }
    }    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel())
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                    .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")
        
        HomeView(
            viewModel: HomeViewModel())
        .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                    .previewDisplayName("iPhone 13 Pro Max")
    }
}
