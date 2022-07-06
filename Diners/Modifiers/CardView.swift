//
//  CardView.swift
//  Diners
//
//  Created by Aaron Thomas on 04/07/2022.
//

import SwiftUI

struct CardView: ViewModifier {
    
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(.white, lineWidth: 2)
                    .shadow(color: .black.opacity(0.6), radius: 2))
            .frame(height: height)
    }
}

extension View {
    
    func cardView(height: CGFloat = 220) -> some View {
        modifier(CardView(height: height))
    }
}
