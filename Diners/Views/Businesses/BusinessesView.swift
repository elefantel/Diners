//
//  BusinessesView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/25.
//

import SwiftUI

struct BusinessesView: View {
    
    let viewModel: BusinessesViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: 10) {
                ForEach(viewModel.businesses) { business in
                    NavigationLink(value: business) {
                        BusinessCardView(business: business)
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color.tealLight)
    }
}

struct BusinessesView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessesView(viewModel: BusinessesViewModel(
            businesses: MockData.businesses))
    }
}
