//
//  TextArea.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        //initialize a binding property with an underscore
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
       
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .foregroundColor(Color(.placeholderText))
            }
            TextEditor(text: $text)
        }
        .font(.body)
    }
}

