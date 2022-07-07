//
//  ChatRowView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct ChatRowView: View {
    var body: some View {
        HStack() {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 34, height: 34)
                .foregroundColor(.yellow)
            
            VStack(alignment: .leading) {
                Text("Peter Pan")
                    .font(.headline)
                Text("Boker tov, long time mate!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0) {
                Text("22:20")
                    .font(.footnote)
                    .foregroundColor(.blue)
                Text("8")
                    .padding(5)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Circle())
            }
        }
    }
}

struct ChatRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRowView()
    }
}
