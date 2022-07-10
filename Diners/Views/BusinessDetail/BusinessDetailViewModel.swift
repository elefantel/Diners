//
//  BusinessDetailViewModel.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import MapKit

final class BusinessDetailViewModel: ObservableObject {
    
    @Published var business: Business

    var otherBusinesses: [Business] {
        businesses.filter { $0.id != business.id }
    }
    
    lazy var detailItems: [DetailItem] = [
        DetailItem(
            image: "dollarsign.circle.fill",
            title: "Price:",
            description: business.price ?? ""),
        DetailItem(
            image: "phone.circle.fill",
            title: "Phone:",
            description: business.displayPhone),
        DetailItem(
            image: "mappin.circle.fill",
            title: "Address:",
            description: business.location.displayAddress.joined(separator: ", "))
    ]
    
    var mapPin: BusinessAnnotation {
        .init(name: business.name, coordinate: coordinate)
    }
    
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
    }
    
    var coordinateRegion: MKCoordinateRegion {
        .init(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    let businesses: [Business]
    
    init(businesses: [Business], business: Business) {
        self.businesses = businesses
        self.business = business
    }
}
