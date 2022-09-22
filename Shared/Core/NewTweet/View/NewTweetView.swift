//
//  NewTweetView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    //this is a variable that recognizes presentation mode
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var tweetViewModel: NewTweetViewModel
    var body: some View {
        VStack{
            HStack{
                Button {
                    //this pops back to the previous screen
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                Spacer()
                Button {
                    tweetViewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                KFImage(URL(string: authViewModel.currentUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                TextArea("Add a new tweet", text: $caption)
                    .foregroundColor(.black)
            }
            .padding()
        }
        //Adds an action to perform when this view detects data emitted by the given publisher.
        //in this case publisher is didTweetUpload bool value
        .onReceive(tweetViewModel.$didTweetUpload) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
