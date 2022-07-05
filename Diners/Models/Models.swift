//
//  Models.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/23.
//

import MapKit
import Foundation

// MARK: - Businesses
struct Businesses: Codable {
    let total: Int
    let businesses: [Business]
    let region: Region
}

// MARK: - Business
struct Business: Codable, Identifiable, Hashable {
    let rating: Double
    let phone, id, alias: String
    let price: String?
    let isClosed: Bool
    let categories: [Category]
    let reviewCount: Int
    let name: String
    let url: String
    let coordinates: Center
    let imageUrl: String
    let location: Location
    let distance: Double
    let transactions: [String]
    let displayPhone: String

    enum CodingKeys: String, CodingKey {
        case rating, price, phone, id, alias
        case isClosed = "is_closed"
        case categories
        case reviewCount = "review_count"
        case name, url, coordinates
        case imageUrl = "image_url"
        case displayPhone = "display_phone"
        case location, distance, transactions
    }
}

// MARK: - Category
struct Category: Codable, Hashable {
    let alias, title: String
}

// MARK: - Center
struct Center: Codable, Hashable {
    let latitude, longitude: Double
}

// MARK: - Location
struct Location: Codable, Hashable {
    let city, country: String
    let address2, address3: String?
    let displayAddress: [String]
    let state, address1, zipCode: String?

    enum CodingKeys: String, CodingKey {
        case city, state, country, address1, address2, address3
        case zipCode = "zip_code"
        case displayAddress = "display_address"
    }
}

// MARK: - Region
struct Region: Codable, Hashable {
    let center: Center
}

// MARK: - BusinessAnnotation
struct BusinessAnnotation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
