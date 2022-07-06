//
//  Pricing.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/23.
//

import Foundation

enum Price: String, CaseIterable, Identifiable {
    
    case all = ""
    case budget = "$"
    case pricey = "$$"
    case bigSpender = "$$$"
    case swashbuckler = "$$$$"
    
    var id: RawValue { rawValue }
    
    var title: String {
        switch self {
        case .all: return "All"
        case .budget: return "Budget"
        case .pricey: return "Pricey"
        case .bigSpender: return "Big Spenders"
        case .swashbuckler: return "Swashbucklers"
        }
    }
}

extension Array where Element == Business {
    func byPricing(_ price: Price?) -> [Element] {
        guard price != .all else { return self }
        return filter { $0.price == price?.rawValue }
    }
}

