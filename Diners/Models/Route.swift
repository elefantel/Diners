//
//  Route.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import Foundation

enum Route: Hashable {
    case businesses(Price)
    case businessDetail(Business)
}
