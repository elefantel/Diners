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
                    NavigationLink(priceCategory.title, value: Route.businesses(priceCategory))
                }
            }
            .colorMultiply(Color.tealLight)
            .padding(.horizontal, -16)
            .scrollIndicators(.hidden)
            .navigationTitle("Categories")
            .onAppear { viewModel.fetchBusinesses() }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case let .businesses(category):
                    BusinessesView(viewModel: BusinessesViewModel(
                        businesses: viewModel.businesses.byPricing(category)))
                        .navigationTitle(category.title)
                        .onAppear { viewModel.selectedCategory = category }
                        .buttonStyle(PlainButtonStyle())
                case let .businessDetail(business):
                    BusinessDetailView(viewModel: BusinessDetailViewModel(
                        businesses: viewModel.businesses.byPricing(viewModel.selectedCategory),
                        business: business))
                }
            }
        }
        .accentColor(Color.tealDark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel())
    }
}
