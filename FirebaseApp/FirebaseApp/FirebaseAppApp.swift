//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/16.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if viewModel.isAuthenticated {
                    HelloPage(viewModel: viewModel)
                } else {
                    SignInView(viewModel: viewModel)
                }
            }
        }
    }
}
