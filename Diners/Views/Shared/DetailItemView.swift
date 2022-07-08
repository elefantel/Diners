//
//  DetailItemView.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct DetailItem: Identifiable {
    var id: String { title }
    let image: String
    let title: String
    let description: String
}

struct DetailItemView: View {
    
    let item: DetailItem
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: item.image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.tealDark)
            Text(item.title)
            Text(item.description)
        }
    }
}
