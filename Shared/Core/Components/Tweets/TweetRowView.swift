//
//  TweetRowView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct TweetRowView: View {
    let tweet: Tweet
    var body: some View {
        VStack(alignment: .leading){
            //profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                //user info & tweet caption
                VStack(alignment: .leading, spacing: 4){
                    //user info
                    HStack{
                        Text("Some Name")
                            .font(.subheadline)
                            .bold()
                        Text("Some Name")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                          
                    }
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //action buttons
            HStack{
                Button {
                    //action here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }.padding()
    }
}


