//
//  AnonymousLoggInView.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/18.
//

import SwiftUI
import FirebaseAuth

struct AnonymousLoggInView: View {
    @State private var isAuthenticated = false
    @State private var userId: String = ""
    
    var body: some View {
        VStack {
            if isAuthenticated {
                Text("匿名ユーザーとしてログイン中")
                Text("UID: \(userId)")
                Button("ログアウト") {
                    logout()
                }
            } else {
                Button("匿名認証でログイン") {
                    loginAnonymously()
                }
            }
        }
        .onAppear {
            checkAuthState()
        }
    }
    
    func loginAnonymously() {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("ログインエラー: \(error.localizedDescription)")
                return
            }
            guard let user = authResult?.user else { return }
            isAuthenticated = true
            userId = user.uid
            print("ログイン成功: UID - \(user.uid)")
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            userId = ""
            print("ログアウト成功")
        } catch {
            print("ログアウトエラー: \(error.localizedDescription)")
        }
    }
    
    func checkAuthState() {
        if let user = Auth.auth().currentUser {
            isAuthenticated = true
            userId = user.uid
        } else {
            isAuthenticated = false
        }
    }
}

#Preview {
    AnonymousLoggInView()
}
