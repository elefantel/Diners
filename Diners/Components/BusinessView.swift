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
        VStack {
            AsyncImage(
                url: URL(string: business.imageUrl),
                content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: 250, height: 250)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(.white, lineWidth: 2))
            .shadow(radius: 2)

            Text(business.name)
                .font(.subheadline)
                .bold()
            
            HStack {
                Text(String(format: "%.1f Stars", business.rating))
                Text("\(business.reviewCount) Reviews")
            }
            .font(.caption)
        }
        .frame(width: 252)
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView(business: MockData.businesses[0])
    }
}
