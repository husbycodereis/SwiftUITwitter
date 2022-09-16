//
//  ProfilePhotoSelectorView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 16.08.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var authViewModel: AuthViewModel

    //this function converts a UIImage into an Image that can be rendered in SwiftUI
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }


    var body: some View {
        VStack {
            HeaderView(upperText: "Setup.", lowerText: "Select a profile picture")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }


            }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
                .padding(.top, 44)
            if let selectedImage = selectedImage {
                BlueRoundedButton(labelText: "Continue") {
                    authViewModel.uploadProfileImage(selectedImage)
                }
            }
            Spacer()
        }
            .ignoresSafeArea()

    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


