//
//  HomeView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/20.
//

import SwiftUI

struct HomeView: View {
    let viewModel: HomeViewModel

    @State private var query = ""
    @State private var searchCategory = ""
    @State var businesses: [Business] = []
    @State private var category: Price?
    @State private var restaurant: Business?
    let priceCategories: [Price] = Price.allCases
    
    var body: some View {
        NavigationSplitView() {
            List(priceCategories, selection: $category) { priceCategory in
                if showSection(for: priceCategory) {
                    NavigationLink(priceCategory.title, value: priceCategory)
                }
            }
            .padding(.horizontal, -16)
            .scrollIndicators(.hidden)
            .navigationTitle("Categories")
            .onAppear {
                Task.init {
                    do {
                        businesses = try await viewModel.businesses()
                    } catch {
                        print(error)
                    }
                }
            }
            .onChange(of: category) { newValue in
                restaurant = nil
            }
        } content: {
            BusinessesView(businesses: businesses.byPricing(category))
                .navigationTitle(category?.title ?? "Restaurants")
        } detail: {
            if let business = restaurant {
                BusinessDetailView(business: business)
            } else {
                Text("Select business")
            }
        }
    }
    
    func showSection(for category: Price ) -> Bool {
        !businesses.byPricing(category).isEmpty
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel())
    }
}
