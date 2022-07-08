//
//  WhatsAppLiteView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct WhatsAppLiteView: View {
    var body: some View {
        TabView {
            ChatsListView()
                .tabItem {
                    Label("Chats", systemImage: "square.and.pencil")
                }
            
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct WhatsAppLiteView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsAppLiteView()
    }
}
