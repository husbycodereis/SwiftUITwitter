//
//  FeedView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack {
                    ForEach(0...20, id: \.self){ _ in
                        TweetRowView()
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
                        NewTweetView()
                    }
            }
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()

        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
