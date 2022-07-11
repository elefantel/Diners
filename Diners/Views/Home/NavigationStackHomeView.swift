//
//  NavigationStackHomeView.swift
//  Diners
//
//  Created by Aaron Thomas on 11/07/2022.
//

import SwiftUI

struct NavigationStackHomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            categoryPicker
            businessesView
        }
        .navigationTitle("Categories")
        .onAppear { viewModel.fetchBusinesses() }
        .backgroundCardView()
        .searchable(text: $viewModel.searchQuery)
        .onChange(of: viewModel.searchQuery) { query in
            Task.init {
               try await viewModel.businesses(from: query)
            }
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case let .businessDetail(business):
                BusinessDetailView(
                    viewModel: BusinessDetailViewModel(
                    businesses: viewModel.businesses
                        .byPricing(viewModel.selectedCategory),
                    business: business))
                .buttonStyle(PlainButtonStyle())
            case let .booking(business):
                BookingView(viewModel: BookingViewModel(business: business))
            }
        }
    }
}

private extension NavigationStackHomeView {
    
    var categoryPicker: some View {
        ForEach(viewModel.priceCategories) { category in
            Text(category.title)
                .font(isSelected(category) ? .title2 : .subheadline)
                .foregroundColor(isSelected(category) ? .black : .gray)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        viewModel.selectedCategory = category
                    }
                }
        }
        .pickerView()
    }
    
    var businessesView: some View {
        ForEach(viewModel.businesses.byPricing(viewModel.selectedCategory)) { business in
            NavigationLink(value: Route.businessDetail(business)) {
                BusinessCardView(business: business)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .gridView(with: viewModel.columns)
    }
    
    private func isSelected(_ category: Price) -> Bool {
        viewModel.selectedCategory == category
    }
}

struct NavigationStackHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackHomeView(viewModel: HomeViewModel())
    }
}
