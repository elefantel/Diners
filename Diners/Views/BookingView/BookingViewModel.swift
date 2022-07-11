//
//  BookingViewModel.swift
//  Diners
//
//  Created by Aaron Thomas on 10/07/2022.
//

import SwiftUI

final class BookingViewModel: ObservableObject {
    
    @Published var date = Date()
    let business: Business
    
    init(business: Business) {
        self.business = business
    }
}
