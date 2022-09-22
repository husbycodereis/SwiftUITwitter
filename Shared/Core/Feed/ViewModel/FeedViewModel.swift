//
//  File.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    let tweetService = TweetService()
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        tweetService.fetchTweets { tweets in
                self.tweets = tweets
        }
    }
}
