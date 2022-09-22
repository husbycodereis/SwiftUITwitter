//
//  NewTweetViewModel.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import Foundation

class NewTweetViewModel: ObservableObject {
    let tweetService = TweetService()
    @Published var didTweetUpload = false
    
    func uploadTweet(withCaption caption: String){
        tweetService.uploadTweet(caption: caption){success in
            if success{
                self.didTweetUpload = true
            } else {
                
            }
        }
    }
}
