//
//  LoginView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        //parent container
        VStack{
            //header view
            VStack(alignment: .leading){
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome Back.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame( minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 260,
                    alignment: .leading
            )
            .padding(.leading)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
