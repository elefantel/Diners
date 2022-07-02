//
//  Pricing.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/23.
//

import Foundation

enum Price: String, CaseIterable, Identifiable {
    
    case budget = "$"
    case pricey = "$$"
    case bigSpender = "$$$"
    case swashbuckler = "$$$$"
    
    var id: RawValue { rawValue }
    
    var title: String {
        switch self {
        case .budget: return "Budget"
        case .pricey: return "Pricey"
        case .bigSpender: return "Big Spenders"
        case .swashbuckler: return "Swashbucklers"
        }
    }
}

extension Array where Element == Business {
    func byPricing(_ price: Price) -> [Element] {
        filter { $0.price == price.rawValue }
    }
}

