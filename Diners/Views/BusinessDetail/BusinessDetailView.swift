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
            ImageView(
                urlString: viewModel.business.imageUrl,
                height: 300)
            ScrollView {
                ScrollViewReader { verticalProxy in
                    businessInfoView
                    Spacer()
                    NavigationLink(value: Route.booking(viewModel.business)) {
                        PrimaryButtonView(image: "calendar", text: "Make a booking")
                            .padding(.horizontal)
                    }
                    otherBusinessesView(
                        viewModel.otherBusinesses,
                        verticalProxy: verticalProxy)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

private extension BusinessDetailView {
    
    var businessInfoView: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(viewModel.business.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer(minLength: 0)
                ReviewsView(
                    business: viewModel.business,
                    imageSize: .init(width: 20, height: 20))
            }
            .id(0)
            ForEach(viewModel.detailItems) { detailItem in
                DetailItemView(item: detailItem)
            }
            MapView(
                items: [viewModel.mapPin],
                region: .constant(viewModel.coordinateRegion))
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    @ViewBuilder
    func otherBusinessesView(_ businesses: [Business],
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
                                    .frame(width: 240)
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
        BusinessDetailView(
            viewModel: BusinessDetailViewModel(
                businesses: MockData.businesses,
                business: MockData.businesses[0]))
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
        .previewDisplayName("iPad Pro (9.7-inch)")
                
        BusinessDetailView(
            viewModel: BusinessDetailViewModel(
            businesses: MockData.businesses,
            business: MockData.businesses[0]))
        .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        .previewDisplayName("iPhone 13 Pro Max")
    }
}

