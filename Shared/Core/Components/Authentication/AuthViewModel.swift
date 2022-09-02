//
//  AuthViewModel.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 15.08.2022.
//

import Foundation
import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    @Published var didAuthenticateUser = false
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG: user session is \(String(describing: self.userSession))")
    }

    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: login with email error message:  \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: User is \(String(describing: self.userSession?.email))")
        }
    }

    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: registration error message is: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            print("DEBUG: User is \(String(describing: self.userSession?.email))")

            let data = ["email": email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]

            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                self.didAuthenticateUser = true
                print("DEBUG: user is saved to database ")
            }
        }
    }

    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
