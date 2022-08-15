//
//  RegisterView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 8.08.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var emailText = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HeaderView(upperText: "Get Started.", lowerText: "Create your account")
            
            VStack(spacing: 40){
                CustomTextField(imageName: "envelope", placeholderText: "Email", text: $emailText)
                CustomTextField(imageName: "person", placeholderText: "Username", text: $userName)
                CustomTextField(imageName: "person", placeholderText: "Full Name", text: $fullName)
                CustomTextField(imageName: "lock", placeholderText: "Password", text: $password)
            }.padding(.top, 44)
             .padding(.horizontal,32)
            BlueRoundedButton(labelText: "Sign Up") {
                print("Sign up canim")
            }
            .padding(.top, 32)
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account? ")
                    Text("Sign In")
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
