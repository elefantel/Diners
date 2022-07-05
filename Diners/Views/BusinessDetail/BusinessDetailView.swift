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
                      width: .infinity,
                      height: 280)
            ScrollView {
                ScrollViewReader { reader in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.business.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer(minLength: 0)
                            ReviewsView(business: viewModel.business,
                                        imageSize: .init(width: 20, height: 20))
                        }
                        .id(0)
                        ForEach(viewModel.detailItems) { detailItem in
                            DetailItemView(item: detailItem)
                        }
                        Map(coordinateRegion: .constant(viewModel.coordinateRegion),
                            annotationItems: [viewModel.mapPin]) {
                            MapMarker(coordinate: $0.coordinate)
                        }
                            .frame(height: 100)
                    }
                    .padding(.horizontal)
                    Spacer()
                    if viewModel.otherBusinesses.count > 0 {
                        VStack(alignment: .leading) {
                            Text("Other restaurants")
                                .font(.headline)
                            ScrollView(.horizontal) {
                                HStack(spacing: 8) {
                                    ForEach(viewModel.otherBusinesses) { business in
                                        BusinessCardView(business: business)
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
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(viewModel: BusinessDetailViewModel(
            businesses: MockData.businesses,
            business: MockData.businesses[0]))
    }
}

