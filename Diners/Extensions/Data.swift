//
//  Data.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/27.
//

import Foundation

extension Data {
    var prettyJson: String {
        guard
            let json = try? JSONSerialization.jsonObject(
                with: self,
                options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        else { return "" }
        return String(decoding: jsonData, as: UTF8.self)
    }
}
