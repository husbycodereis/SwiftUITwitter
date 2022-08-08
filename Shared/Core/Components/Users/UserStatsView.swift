//
//  UserStatsView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack( spacing: 24){
            HStack( spacing: 4){
                Text("250").bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 4){
                Text("251").bold()
                Text("Followers").font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
