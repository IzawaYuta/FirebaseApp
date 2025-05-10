//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/16.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

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
//                if viewModel.isAuthenticated {
//                    HelloPage(viewModel: viewModel)
//                } else {
//                    SignInView(viewModel: viewModel)
//                }
                AutomaLoggInView()
                    .onAppear {
                        authenticateUser()
                    }
            }
        }
    }
    
    func authenticateUser() {
        if Auth.auth().currentUser == nil {
            // 匿名認証を実行
            Auth.auth().signInAnonymously { authResult, error in
                if let error = error {
                    print("匿名認証エラー: \(error.localizedDescription)")
                    return
                }
                if let user = authResult?.user {
                    print("匿名認証成功: UID - \(user.uid)")
                }
            }
        } else {
            // 既存の認証情報を利用
            if let user = Auth.auth().currentUser {
                print("既存のユーザー認証済み: UID - \(user.uid)")
            }
        }
    }
}
