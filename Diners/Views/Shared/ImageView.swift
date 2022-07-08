//
//  ImageView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct ImageView: View {

    let urlString: String
    var height: CGFloat = 160

    var body: some View {
        AsyncImage(
            url: URL(string: urlString),
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: height)
                    .clipped()
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}
