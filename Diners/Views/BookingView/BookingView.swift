//
//  BookingView.swift
//  Diners
//
//  Created by Aaron Thomas on 06/07/2022.
//

import SwiftUI

struct BookingView: View {
    
    let business: Business
    @State private var date = Date()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("When would you like to visit \(business.name)?")
                .font(.title2)
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .frame(maxWidth: .infinity)
            .datePickerStyle(.graphical)
            .navigationTitle("Select a date")
            .backgroundCardView()
            PrimaryButtonView(text: "Continue")
            Spacer()
        }
        .padding()
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(business: MockData.businesses[0])
    }
}
