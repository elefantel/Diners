//
//  ChatsListView.swift
//  Diners
//
//  Created by Mpendulo Ndlovu on 2022/07/06.
//

import SwiftUI

struct ChatsListView: View {
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(1..<20) { _ in
                    ChatRowView()
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Chats")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { text in
            // filter data source
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView()
    }
}
