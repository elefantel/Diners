//
//  ReviewsView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct ReviewsView: View {
    
    let business: Business
    var imageSize: CGSize = .init(width: 10, height: 10)
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                .foregroundColor(.yellow)
            Text(String(format: "%.1f", business.rating))
            Text("(\(business.reviewCount) reviews)")
        }
    }
}
