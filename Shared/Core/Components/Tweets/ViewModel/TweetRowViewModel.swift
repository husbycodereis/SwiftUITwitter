//
//  TweetRowViewModel.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.10.2022.
//

import Foundation

class TweetRowViewModel : ObservableObject {
    let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
        
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
