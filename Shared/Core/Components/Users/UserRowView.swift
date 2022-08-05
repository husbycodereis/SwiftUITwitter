//
//  UserRowView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
               Circle()
                .frame(width: 48, height: 48)
            VStack(alignment: .leading, spacing: 4){
                Text("Name")
                    .font(.subheadline).bold()
                Text("Some Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
