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
    let priceCategories: [Price] = Price.allCases.reversed()
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(priceCategories) { priceCategory in
                    if showSection(for: priceCategory) {
                        Section(priceCategory.title) {
                            BusinessesView(businesses: businesses.byPricing(priceCategory))
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .font(.headline)
                        .fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal, -8)
            .scrollIndicators(.hidden)
            .navigationTitle("Restaurants")
        }
        .searchable(text: $query)
        .onChange(of: query) { newValue in
            Task.init {
                businesses = try await viewModel.businesses(from: query)
            }
        }
        .onAppear {
            Task.init {
                do {
                    businesses = try await viewModel.businesses()
                } catch {
                    print(error)
                }
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
