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
            ImageView(urlString: business.imageUrl)
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                ReviewsView(business: business)
                    .font(.caption)
                    .fontWeight(.regular)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
        }
        .contentShape(Rectangle())
        .cardView()
    }
}

struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(business: MockData.businesses[0])
    }
}
