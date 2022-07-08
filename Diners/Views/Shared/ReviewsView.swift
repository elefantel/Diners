//
//  ReviewsView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct ReviewsView: View {
    
    let rating: Double
    let reviewCount: Int
    var imageSize: CGFloat = 10
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .foregroundColor(.yellow)
            Text(String(format: "%.1f", rating))
                .font(.caption)
                .fontWeight(.regular)
            Text("(\(reviewCount) reviews)")
                .font(.caption)
                .fontWeight(.regular)
        }
    }
}
