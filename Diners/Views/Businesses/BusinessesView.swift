//
//  BusinessesView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import SwiftUI

struct BusinessesView: View {
    
    let businesses: [Business]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(businesses) { business in
                    BusinessCardView(business: business)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct BusinessesView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessesView(businesses: MockData.businesses)
    }
}
