//
//  DinersApp.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/06/20.
//

import SwiftUI

@main
struct DinersApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
