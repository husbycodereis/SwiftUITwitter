//
//  FeedView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var feedViewModel = FeedViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack {
                    ForEach(feedViewModel.tweets ){ tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 60, height: 60)
                    .fullScreenCover(isPresented: $showNewTweetView) {
                        NewTweetView().environmentObject(TweetViewModel())
                    }
            }
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()

        }
    }
}

