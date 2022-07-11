//
//  RowImage.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct RowImage: View {
    let url: String
    let size: CGFloat = 64
    
    var body: some View {
        AsyncImage(
            url: URL(string: url),
            content: { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: size, height: size)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(width: size, height: size)
        .clipShape(RoundedRectangle(cornerRadius: size/2, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: size/2, style: .continuous)
                .stroke(.white, lineWidth: 1))
        .shadow(radius: 1)
    }
}

struct RowImage_Previews: PreviewProvider {
    static var previews: some View {
        RowImage(url: "https://s3-media2.fl.yelpcdn.com/bphoto/MmgtASP3l_t4tPCL1iAsCg/o.jpg")
    }
}
