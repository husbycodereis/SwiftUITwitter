//
//  File.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    let tweetService = TweetService()
    let userService = UserService()
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    func fetchTweets(){
        tweetService.fetchTweets { tweets in
                self.tweets = tweets
            for i in 0 ..< tweets.count {
                self.userService.fetchUser(withUid: tweets[i].uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
