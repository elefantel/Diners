//
//  ChatsView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct ChatsView: View {
    let chats = [ChatRowView(), ChatRowView(), ChatRowView(), ChatRowView(), ChatRowView()]
    var body: some View {
        NavigationStack {
            List(chats) { chat in
                chat
            }
        }
        .padding()
        .navigationTitle("Chats")
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
