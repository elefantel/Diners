//
//  CardView.swift
//  Diners
//
//  Created by Aaron Thomas on 04/07/2022.
//

import SwiftUI

struct CardView: ViewModifier {
    
    let size: CGSize
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(.white, lineWidth: 2)
                    .shadow(color: .black.opacity(0.5), radius: 2))
            .frame(width: size.width, height: size.height)
    }
}

extension View {
    
    func cardView(size: CGSize = CGSize(width: 170, height: 300)) -> some View {
        modifier(CardView(size: size))
    }
}
