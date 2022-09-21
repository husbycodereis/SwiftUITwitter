//
//  user.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 16.09.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
