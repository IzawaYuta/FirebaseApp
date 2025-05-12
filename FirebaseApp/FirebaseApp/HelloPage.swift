//
//  HelloPage.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/16.
//

import SwiftUI
import FirebaseAnalytics

// ログイン後の画面
struct HelloPage: View {
    var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Hello, you're logged in!")
                .font(.title)
                .padding()
            Button("Log Out") {
                // ログアウトしてログイン画面へ遷移する
                viewModel.signOut()
            }
        }
        .onAppear {
            // Firebase Analyticsに画面名を記録
            Analytics.logEvent(AnalyticsEventScreenView, parameters: [
                AnalyticsParameterScreenName: "HelloPage",
                AnalyticsParameterScreenClass: "HelloPage"
            ])
        }
    }
}
