//
//  BookingView.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import SwiftUI

struct BookingView: View {
    
    @ObservedObject var viewModel: BookingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            titleView
            datePickerView
            PrimaryButtonView(text: "Continue")
            Spacer()
        }
        .padding()
    }
}

extension BookingView {
    
    var titleView: some View {
        Text("When would you like to visit \(viewModel.business.name)?")
            .font(.title2)
    }
    
    var datePickerView: some View {
        DatePicker(
            "Start Date",
            selection: $viewModel.date,
            displayedComponents: [.date]
        )
        .frame(maxWidth: .infinity)
        .datePickerStyle(.graphical)
        .navigationTitle("Select a date")
        .backgroundCardView()
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = BookingViewModel(business: MockData.businesses[0])
        BookingView(viewModel: viewModel)
    }
}
