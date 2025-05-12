//
//  SignUpView.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/16.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign Up") {
                viewModel.signUp(email: email, password: password)
            }
            
            if viewModel.isAuthenticated {
                // ログイン後のページに遷移
                if viewModel.isAuthenticated {
                    HelloPage(viewModel: viewModel)
                }
                
            }
        }
    }
}
