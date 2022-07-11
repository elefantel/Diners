//
//  MapView.swift
//  Diners
//
//  Created by Aaron Thomas on 10/07/2022.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    var height: CGFloat = 200
    let items: [BusinessAnnotation]
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: items) {
            MapMarker(coordinate: $0.coordinate)
        }
        .cornerRadius(10)
        .frame(height: height)
    }
}
