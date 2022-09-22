//
//  TweetServoc.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import Firebase

class TweetService {
    func uploadTweet(caption: String, completion: @escaping (Bool)-> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())
        ] as [String : Any]
        Firestore.firestore().collection("tweets").document().setData(data) { error in
            if let error = error {
                completion(false)
                print("There was an error uploading the tweet: \(error.localizedDescription)")
                return
            }
            completion(true)
        }
    }
}
