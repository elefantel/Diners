//
//  PrimaryButton.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import SwiftUI

struct PrimaryButton: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.tealDark)
            .clipShape(Capsule())
            .padding(.top)
    }
}

extension View {
    
    func primaryButton() -> some View {
        modifier(PrimaryButton())
    }
}


    
