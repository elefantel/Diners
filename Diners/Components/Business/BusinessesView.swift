//
//  BusinessesView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import SwiftUI

struct BusinessesView: View {
    let businesses: [Business]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(businesses) { business in
                    BusinessView(business: business)
                }
            }
            .padding(2)
        }
        .listRowBackground(Color.clear)
        .scrollIndicators(.hidden)
    }
}

struct BusinessesView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessesView(businesses: MockData.businesses)
    }
}
