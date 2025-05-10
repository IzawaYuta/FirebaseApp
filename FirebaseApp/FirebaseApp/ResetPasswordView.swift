//
//  ResetPasswordView.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/16.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Reset Password") {
                viewModel.resetPassword(email: email)
            }
        }
    }
}
