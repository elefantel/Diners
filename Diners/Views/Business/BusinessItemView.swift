//
//  BusinessView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/24.
//

import SwiftUI

struct BusinessItemView: View {
    let business: Business
    
    var body: some View {
        VStack(spacing: 0) {
            ImageView(urlString: business.imageUrl)
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                // Refactor
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", business.rating))
                    Text("(\(business.reviewCount) reviews)")
                }
                .font(.caption)
                .fontWeight(.regular)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
        }
        .cardView()
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessItemView(business: MockData.businesses[0])
    }
}
