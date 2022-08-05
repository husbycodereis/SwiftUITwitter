//
//  ProfileView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    //TODO: check what namespaces do
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
           

            Color(.systemBlue)
                .ignoresSafeArea()
            VStack{
                Button {
                    
                } label: {
                      Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                }
                Circle()
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
                Text("Adams")
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@some_person")
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
            
            HStack( spacing: 24){
                HStack( spacing: 4){
                    Text("250").bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                HStack(spacing: 4){
                    Text("251").bold()
                    Text("Followers").font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
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
                ForEach(0...9, id: \.self){ _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}
