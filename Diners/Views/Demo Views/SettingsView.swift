//
//  SettingsView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ProfilePreview()
                }
                
                Section {
                    Text("Starred Messages")
                    Text("Linked Devices")
                }
                
                Section {
                    Text("Account")
                    Text("Chats")
                    Text("Notifications")
                }
                
                Section {
                    Text("Help")
                    Text("Refer freinds")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
