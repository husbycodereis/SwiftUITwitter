//
//  userService.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 16.09.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    //@escaping keeps a function alive after it is performed, this means the completion can still run
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            //if a try has ? and if it is inside a guard, then it is not necessary to add a catch block
            guard let user = try? snapshot.data(as: User.self) else { return }
            completion(user)
        }
    }

    func fetchUsers(completion: @escaping([User]) -> Void) {
     
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
                //compactMap works as foreach loop
                // $0 represents each elements inside a list
                let users = documents.compactMap({try? $0.data(as: User.self)})
            completion(users)
        }
    }
}
