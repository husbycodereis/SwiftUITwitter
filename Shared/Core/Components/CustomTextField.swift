//
//  CustomTextField.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 12.08.2022.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(.darkGray))
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "envelope", placeholderText: "hello canim", text: .constant(""))
    }
}
