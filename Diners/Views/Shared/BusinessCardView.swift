//
//  BusinessCardView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct BusinessCardView: View {
    let business: Business
    
    var body: some View {
        VStack(spacing: 0) {
            Color.clear
                .background(ImageView(urlString: business.imageUrl))
            VStack(alignment: .leading, spacing: 4) {
                Text(business.name)
                    .lineLimit(2)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                ReviewsView(rating: business.rating,
                            reviewCount: business.reviewCount)
                    .font(.caption)
                    .fontWeight(.regular)
            }
            .frame(maxWidth: .infinity,
                   minHeight: 50,
                   maxHeight: 50,
                   alignment: .topLeading)
            .padding()
        }
        .cardView()
    }
}

struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(business: MockData.businesses[0])
    }
}
