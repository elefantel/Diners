//
//  MockData.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import Foundation

struct MockData {
    static var businesses: [Business] {
        var data: [Business] = []
        for i in 0..<50 {
            var price = ""
            let count = (i % 4) + 1
            for _ in 1...count { price += "$"}
            data.append(
                Business(rating: 4, phone: "$$$", id: "1234567", alias: "1", price: "$$", isClosed: false, categories: [], reviewCount: 876, name: "San Franc Bar", url: "https://www.yelp.com/biz/four-barrel-coffee-san-francisco", coordinates: Center(latitude: 10, longitude: 10), imageUrl: "https://s3-media2.fl.yelpcdn.com/bphoto/MmgtASP3l_t4tPCL1iAsCg/o.jpg", location: Location(city: "San Francisco", country: "USA", address2: "", address3: "", displayAddress: [
                    "35 W 13th St",
                    "New York, NY 10011"
                ], state: "CA", address1: "375 Valencia St", zipCode: "94103"), distance: 200.0, transactions: [], displayPhone: "(212) 367-1979")
            )
        }
        return data
    }
}
