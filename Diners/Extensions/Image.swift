//
//  Image.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/24.
//

import SwiftUI

extension Image {
    func sizeToFit(_ contentMode: ContentMode = .fit,
                   width: CGFloat,
                   height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .frame(width: width, height: height)
   }
}
