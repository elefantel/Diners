//
//  BusinessesViewModel.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

final class BusinessesViewModel {
    
    let businesses: [Business]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(businesses: [Business]) {
        self.businesses = businesses
    }
}
