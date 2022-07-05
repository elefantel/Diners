//
//  BusinessDetailView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/29.
//

import MapKit
import SwiftUI

struct BusinessDetailView: View {
    
    let businesses: [Business]
    let business: Business
    
    private var mapPin: BusinessAnnotation {
        .init(name: business.name, coordinate: coordinate)
    }
    private var coordinate: CLLocationCoordinate2D {
        .init(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
    }
    
    var body: some View {
        VStack {
            ImageView(urlString: business.imageUrl,
                      width: .infinity,
                      height: 280)
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(business.name)
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer(minLength: 0)
                        // Refactor
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", business.rating))
                            Text("(\(business.reviewCount) reviews)")
                        }
                    }
                    // Refactor
                    DetailItemView(image: "dollarsign.circle.fill",
                                   title: "Price",
                                   text: business.price ?? "")
                    DetailItemView(image: "phone.circle.fill",
                                   title: "Phone",
                                   text: business.displayPhone)
                    DetailItemView(image: "mappin.circle.fill",
                                   title: "Address",
                                   text: business.location.displayAddress.joined(separator: ", "))
                    
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), annotationItems: [mapPin]) {
                        MapMarker(coordinate: $0.coordinate)
                    }
                    .frame(height: 100)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Other items view
                VStack(alignment: .leading) {
                    Text("Other restaurants")
                        .fontWeight(.semibold)
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(businesses) { business in
                                BusinessItemView(business: business)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(businesses: MockData.businesses,
                           business: MockData.businesses[0])
    }
}

struct DetailItemView: View {
    
    var image: String
    var title: String
    var text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.tealDark)
            Text(title)
                .fontWeight(.semibold)
            Text(text)
        }
    }
}

