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
            NavigationStack {
                VStack(alignment: .center) {
                    headerView
                    navigationButtons
                }
                .padding(.horizontal)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .stackView:
                        NavigationStackHomeView(
                            viewModel: HomeViewModel(
                                selectedCategory: .all))
                            .navigationBarBackButtonHidden(true)
                    case .splitView:
                        NavigationSplitHomeView(
                            viewModel: HomeViewModel())
                            .navigationBarBackButtonHidden(true)
                    }
                }
            }
            .accentColor(Color.tealDark)
        }
    }
}

private extension DinersApp {
    
    @ViewBuilder
    var headerView: some View {
        Text("Welcome to the Diners app")
            .font(.title)
            .padding(.vertical)
        Text("Select a navigation style and force close the app to switch between them!")
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var navigationButtons: some View {
        NavigationLink(value: AppRoute.stackView) {
            PrimaryButtonView(
                image: "square.stack.3d.up.fill",
                text: "NavigationStackView")
        }
        NavigationLink(value: AppRoute.splitView) {
            PrimaryButtonView(
                image: "square.stack.3d.down.right.fill",
                text: "NavigationSplitView")
        }
    }
}
