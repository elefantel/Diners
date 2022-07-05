//
//  BusinessDetailView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/29.
//

import SwiftUI

struct BusinessDetailView: View {
    let business: Business
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BusinessDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailView(business: MockData.businesses[0])
    }
}
