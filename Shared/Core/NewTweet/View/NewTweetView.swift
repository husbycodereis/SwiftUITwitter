//
//  NewTweetView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    //this is a variable that recognizes presentation mode
    @Environment(\.presentationMode) var presentationMode
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
                    print("Tweet")
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
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("Add a new tweet", text: $caption)
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
