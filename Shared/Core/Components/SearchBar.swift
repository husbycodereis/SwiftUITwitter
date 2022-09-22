//
//  SearchBar.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .padding()
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            //similar to stack, this property overlays another widget on top of the selected widget
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 8, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
