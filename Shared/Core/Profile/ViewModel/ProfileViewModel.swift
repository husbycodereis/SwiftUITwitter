//
//  ProfileViewModel.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.10.2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    private let service = TweetService()
    let user: User
    
    init(user: User){
        self.user = user
        fetchUserTweets()
        
    }
    
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
           
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
                
    }
}
