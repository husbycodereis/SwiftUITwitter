//
//  BlueRoundedButton.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 15.08.2022.
//

import SwiftUI

struct BlueRoundedButton: View {
    let labelText: String
    let onPressed: () -> Void
    var body: some View {
        Button {
            onPressed()
        } label: {
            Text(labelText)
               
        }
        .font(.headline)
        .foregroundColor(.white)
        .frame(width: 340, height: 50)
        .background(.blue)
        .clipShape(Capsule())
        .padding()
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct BlueRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueRoundedButton(labelText: "LabelText", onPressed: {
            print("Hello canims")
        })
    }
}
