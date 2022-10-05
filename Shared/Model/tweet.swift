//
//  tweet.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 22.09.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let uid: String
    let caption: String
    var likes: Int
    let timestamp: Timestamp
    
    var user: User?
    var didLike: Bool? = false
}
