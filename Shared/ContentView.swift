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
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
