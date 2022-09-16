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
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
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
            self.tempUserSession = user

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

    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageManager.shared.upload(image: image) { [weak self] result in
          switch result {
          case .success(let urlString):
            Firestore.firestore().collection("users")
              .document(uid)
              .updateData(["profileImageUrl": urlString]) { _ in
                self?.userSession = self?.tempUserSession
               // self?.fetchUser()
              }
            
          case .failure(let error):
            print(error)
          }
        }
      }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid)
    }
}
