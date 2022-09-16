//
//  userService.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 16.09.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else {return}
            //if a try has ? and if it is inside a guard, then it is not necessary to add a catch block
            guard let user = try? snapshot.data(as: User.self) else {return}
            print("DEBUG: Username is \(user.username)")
        }
    }
}
