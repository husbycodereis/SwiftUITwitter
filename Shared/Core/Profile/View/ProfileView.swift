//
//  ProfileView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject private var profileViewModel: ProfileViewModel
    //makes pop back to previous page
    @Environment(\.presentationMode) var mode
    //TODO: check what namespaces do
    @Namespace var animation
    private let user: User
    
    init(user: User) {
        self.user = user
        self.profileViewModel = ProfileViewModel(user: user)
    }
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        }
        .navigationBarHidden(true)
    }
}


extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
           

            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                      Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 36)
            }
               
        }
        .frame( height: 98)
    }
    
    var actionButtons: some View {
        HStack{
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth:1))
            Button {
                //
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            }

        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack{
                Text(user.fullname)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Some interesting sentence")
                .font(.subheadline)
                .padding(.vertical)
            HStack( spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location")
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.somelink.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
           UserStatsView()
                .padding(.vertical)
            
        }
        .padding()
    }
    
    var tweetFilterBar: some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? nil : .gray)
                        
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
               
            }
       
        }
        .overlay(Divider().offset(x:0, y:16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack{
                ForEach(profileViewModel.tweets){ tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
