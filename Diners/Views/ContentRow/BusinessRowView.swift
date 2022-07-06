//
//  BusinessRowView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct BusinessRowView: View {
    let business: Business
    
    var body: some View {
        HStack(spacing: 12) {
            RowImage(url: business.imageUrl)
            VStack(alignment: .leading, spacing: 4) {
                Text(business.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                ReviewsView(rating: business.rating,
                            reviewCount: business.reviewCount)
            }
        }
    }
}

struct BusinessRowView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessRowView(business: Business(rating: 4, phone: "$$$", id: "123456", alias: "1", price: "$$", isClosed: false, categories: [], reviewCount: 876, name: "San Franc Bar", url: "https://www.yelp.com/biz/four-barrel-coffee-san-francisco", coordinates: Center(latitude: 10, longitude: 10), imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/MmgtASP3l_t4tPCL1iAsCg/o.jpg", location: Location(city: "San Francisco", country: "USA", address2: "", address3: "", displayAddress: [
            "35 W 13th St",
            "New York, NY 10011"
        ], state: "CA", address1: "375 Valencia St", zipCode: "94103"), distance: 200.0, transactions: [], displayPhone: "(212) 367-1979"))
    }
}
