//
//  GridView.swift
//  Diners
//
//  Created by Aaron Thomas on 10/07/2022.
//

import SwiftUI

struct GridView: ViewModifier {
    
    let columns: [GridItem]
        
    func body(content: Content) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                content
            }
            .padding(.horizontal)
        }
    }
}

extension View {
    
    func gridView(with columns: [GridItem]) -> some View {
        modifier(GridView(columns: columns))
    }
}
