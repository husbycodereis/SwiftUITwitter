//
//  SwiftUITwitterApp.swift
//  Shared
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI
import Firebase

@main
struct SwiftUITwitterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
 
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
