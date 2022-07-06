//
//  BookingButton.swift
//  Diners
//
//  Created by Aaron Thomas on 05/07/2022.
//

import SwiftUI

struct BookingButton: View {
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
            Text("Make a booking")
                .fontWeight(.semibold)
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.tealDark)
        .clipShape(Capsule())
        .padding(.top)
        .padding(.horizontal)
    }
}
