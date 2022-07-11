//
//  Route.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import Foundation

enum Route: Hashable {
    case businessDetail(Business)
    case booking(Business)
}

enum AppRoute {
    case splitView
    case stackView
}
