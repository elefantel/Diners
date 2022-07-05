//
//  BusinessView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/24.
//

import SwiftUI

struct BusinessView: View {
    let business: Business
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(
                url: URL(string: business.imageUrl),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipped()
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack(alignment: .leading) {
                Text(business.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", business.rating))
                    Image(systemName: "quote.bubble")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.tealDark)
                    Text("\(business.reviewCount) Reviews")
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
        BusinessView(business: MockData.businesses[0])
    }
}
