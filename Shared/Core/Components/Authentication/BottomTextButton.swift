//
//  BottomTextButton.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 15.08.2022.
//

import SwiftUI

struct BottomTextButton<Content: View>: View {
    var firstText: String
    var secondText: String
    var content: () -> Content
    init(firstText: String, secondText: String,
        @ViewBuilder content: @escaping () -> Content) {
        self.firstText = firstText
        self.secondText = secondText
            self.content = content
        }
    var body: some View {
        NavigationLink {
            content()
        } label: {
            Text(firstText)
            Text(secondText).fontWeight(.semibold)
        }.font(.footnote)
            .foregroundColor(.blue)
            .padding(.bottom, 32)
    }
}

struct BottomTextButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextButton(
            firstText: "First Text", secondText: "Second Text",
            content: { LoginView()})
    }
}
