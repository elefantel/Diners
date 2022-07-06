//
//  BusinessDetailView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/29.
//

import MapKit
import SwiftUI

struct BusinessDetailView: View {
    
    @ObservedObject var viewModel: BusinessDetailViewModel
    
    var body: some View {
        VStack {
            ImageView(urlString: viewModel.business.imageUrl,
                      height: 300)
            ScrollView {
                ScrollViewReader { reader in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.business.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer(minLength: 0)
                            ReviewsView(rating: viewModel.business.rating,
                                        reviewCount: viewModel.business.reviewCount,
                                        imageSize: 20)
                        }
                        .id(0)
                        ForEach(viewModel.detailItems) { detailItem in
                            DetailItemView(item: detailItem)
                        }
                        Map(coordinateRegion: .constant(viewModel.coordinateRegion),
                            annotationItems: [viewModel.mapPin]) {
                            MapMarker(coordinate: $0.coordinate)
                        }
                        .cornerRadius(10)
                        .frame(height: 250)
                    }
                    .padding(.horizontal)
                    Spacer()
                    if !viewModel.otherBusinesses.isEmpty {
                        VStack(alignment: .leading) {
                            Text("Other businesses")
                                .font(.headline)
                            ScrollView(.horizontal) {
                                HStack(spacing: 8) {
                                    ForEach(viewModel.otherBusinesses) { business in
                                        BusinessCardView(business: business)
                                            .frame(width: 240)
                                            .onTapGesture {
                                                withAnimation { viewModel.business = business }
                                            }
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding()
                        .onChange(of: viewModel.business) { _ in
                            reader.scrollTo(0)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(viewModel: BusinessDetailViewModel(
            businesses: MockData.businesses,
            business: MockData.businesses[0]))
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                    .previewDisplayName("iPad Pro (12.9-inch) (5th generation)")
        
        BusinessDetailView(viewModel: BusinessDetailViewModel(
            businesses: MockData.businesses,
            business: MockData.businesses[0]))
        .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                    .previewDisplayName("iPhone 13 Pro Max")
    }
}

