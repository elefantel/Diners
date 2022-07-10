//
//  PickerView.swift
//  Diners
//
//  Created by Aaron Thomas on 10/07/2022.
//

import SwiftUI

struct PickerView: ViewModifier {
        
    func body(content: Content) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                content
            }
        }
        .padding()
        .scrollIndicators(.hidden)
    }
}

extension View {
    
    func pickerView() -> some View {
        modifier(PickerView())
    }
}
