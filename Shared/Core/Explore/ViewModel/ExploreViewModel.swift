//
//  ExploreViewModel.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 21.09.2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    init(){
        fetchUsers()
    }
    
    var searchableUsers: [User] {
        if searchText.isEmpty{
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.fullname.lowercased().contains(lowercasedQuery) ||
                $0.username.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            print("DEBUG: users are \(users)")
        }
       
    }
}
