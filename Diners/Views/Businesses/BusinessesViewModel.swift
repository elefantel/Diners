//
//  BusinessesViewModel.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

final class BusinessesViewModel {
    
    let businesses: [Business]
    let columns = Array(repeating: GridItem(.adaptive(minimum: 170)), count: 2)
    
    init(businesses: [Business]) {
        self.businesses = businesses
    }
}
