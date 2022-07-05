//
//  BusinessDetailView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/29.
//

import MapKit
import SwiftUI

struct BusinessDetailView: View {
    
    let viewModel: BusinessDetailViewModel
    
    var body: some View {
        VStack {
            ImageView(urlString: viewModel.business.imageUrl,
                      width: .infinity,
                      height: 280)
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.business.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer(minLength: 0)
                        ReviewsView(business: viewModel.business,
                                    imageSize: .init(width: 20, height: 20))
                    }
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
                VStack(alignment: .leading) {
                    Text("Other restaurants")
                        .fontWeight(.semibold)
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(viewModel.businesses) { business in
                                BusinessCardView(business: business)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BusinessDetailViewModel(businesses: MockData.businesses,
                                                business: MockData.businesses[0])
        BusinessDetailView(viewModel: viewModel)
    }
}

