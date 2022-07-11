//
//  HomeView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/20.
//

import SwiftUI

struct NavigationSplitHomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.priceCategories,
                 selection: $viewModel.selectedCategory) { priceCategory in
                if viewModel.showSection(for: priceCategory) {
                    NavigationLink(priceCategory.title, value: priceCategory)
                }
            }
            .navigationTitle("Categories")
            .task {
                do {
                    try await viewModel.businesses(from: viewModel.searchQuery)
                } catch {
                    print(error)
                }
            }
        } content: {
            contentView
        } detail: {
            detailView
        }
    }
}

private extension NavigationSplitHomeView {
    
    var contentView: some View {
        ZStack {
            if let category = viewModel.selectedCategory {
                List(viewModel.businesses.byPricing(category),
                     selection: $viewModel.selectedBusiness) { business in
                    NavigationLink(value: business) {
                        BusinessRowView(business: business)
                    }
                }
                .searchable(text: $viewModel.searchQuery)
                .onChange(of: viewModel.searchQuery) { query in
                    Task.init {
                    try await viewModel.businesses(from: query)
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle(category.title)
            } else {
                Text("Select price category")
                    .foregroundColor(.gray)
            }
        }
    }
    
    var detailView: some View {
        NavigationStack {
            if let business = viewModel.selectedBusiness {
                BusinessDetailView(viewModel: BusinessDetailViewModel(
                    businesses: viewModel.businesses.byPricing(viewModel.selectedCategory),
                    business: business))
            } else {
                Text("Select business")
                    .foregroundColor(.gray)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct NavigationSplitHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSplitHomeView(
            viewModel: HomeViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")
        
        NavigationSplitHomeView(
            viewModel: HomeViewModel())
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                .previewDisplayName("iPhone 13 Pro Max")
    }
}
