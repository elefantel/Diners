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
        VStack(spacing: 0) {
            ImageView(urlString: viewModel.business.imageUrl,
                      width: .infinity,
                      height: 280)
            ScrollView {
                ScrollViewReader { verticalProxy in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(viewModel.business.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer(minLength: 10)
                            ReviewsView(business: viewModel.business,
                                        imageSize: .init(width: 15, height: 15))
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
                    .padding(.top)
                    Spacer()
                    
                    BookingButton()
                    
                    otherBusinessesView(viewModel.otherBusinesses,
                                        verticalProxy: verticalProxy)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

extension BusinessDetailView {
    
    @ViewBuilder
    private func otherBusinessesView(_ businesses: [Business],
                                     verticalProxy: ScrollViewProxy) -> some View {
        if viewModel.otherBusinesses.count > 0 {
            VStack(alignment: .leading) {
                Text("Other restaurants")
                    .font(.headline)
                ScrollView(.horizontal) {
                    ScrollViewReader { horizontalProxy in
                        HStack(spacing: 8) {
                            ForEach(viewModel.otherBusinesses.indices,
                                    id: \.self) { index in
                                let business = viewModel.otherBusinesses[index]
                                BusinessCardView(business: business)
                                    .id(index)
                                    .onTapGesture {
                                        withAnimation { viewModel.business = business }
                                    }
                            }
                        }
                        .onChange(of: viewModel.business) { _ in
                            verticalProxy.scrollTo(0)
                            horizontalProxy.scrollTo(0)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
        }
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(viewModel: BusinessDetailViewModel(
                    businesses: MockData.businesses,
                    business: MockData.businesses[0]))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                            .previewDisplayName("iPad Pro (9.7-inch)")
                
                BusinessDetailView(viewModel: BusinessDetailViewModel(
                    businesses: MockData.businesses,
                    business: MockData.businesses[0]))
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                            .previewDisplayName("iPhone 13 Pro Max")
    }
}

