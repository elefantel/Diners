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
        .accentColor(Color.tealDark)
    }
}

private extension HomeView {
    
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
