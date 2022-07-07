//
//  ProfilePreview.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct ProfilePreview: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 34, height: 34)
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading) {
                Text("Super Mario")
                    .font(.headline)
                Text("Jumping over castles")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ProfilePreview_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePreview()
    }
}
