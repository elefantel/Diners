//
//  PrimaryButtonView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    var image: String?
    let text: String
    
    var body: some View {
        HStack {
            if let image {
                Image(systemName: image)
            }
            Text(text)
                .fontWeight(.semibold)
        }
        .primaryButton()
    }
}
