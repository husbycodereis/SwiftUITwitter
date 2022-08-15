//
//  ContentView.swift
//  Shared
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @Environment(\.colorScheme) var colorScheme
    //if a viewmodel will be used in multiple views, then the viewmodel must be called as a type in the view and .environmentObject() in the main file
    //if a viewModel will only be used in one view, then it can be created as var viewModel: ViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
               .navigationBarHidden(showMenu)
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                //the shadow will stretch through whole screen with this option on
                .ignoresSafeArea()
            }
            SideMenuView()
                .frame(width:300)
                .offset(x: showMenu ? 0: -300, y: 0)
                .background(showMenu ? colorScheme == .dark ?
                    .black : .white : .clear)
        }
        //navigationTitle inside NavigationView works as an AppBar
        .navigationTitle("home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }

            }
        }
        .onAppear{
            showMenu = false
        }
    }
}
