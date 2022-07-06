//
//  BackgroundCardView.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import SwiftUI

struct BackgroundCardView: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .padding(.top)
            .background(Rectangle()
                .foregroundColor(Color.tealLight)
                .cornerRadius(40)
                .edgesIgnoringSafeArea(.bottom))
    }
}

extension View {
    
    func backgroundCardView() -> some View {
        modifier(BackgroundCardView())
    }
}

    
