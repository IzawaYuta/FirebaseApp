//
//  AutomaLoggInView.swift
//  FirebaseApp
//
//  Created by Engineer MacBook Air on 2025/04/18.
//

import SwiftUI
import FirebaseAuth
import FirebaseAnalytics

struct AutomaLoggInView: View {
    @State private var userId: String = ""
    
    var body: some View {
        VStack {
            Text("アプリ起動時に匿名認証が行われます")
                .padding()
            if let user = Auth.auth().currentUser {
                Text("現在のUID: \(user.uid)")
            }
        }
        .onAppear {
            Analytics.logEvent(AnalyticsEventScreenView, parameters: [
                AnalyticsParameterScreenName: "AutomaLoggIn1",
                AnalyticsParameterScreenClass: "AutomaLoggIn2"
            ])
        }
    }
}

#Preview {
    AutomaLoggInView()
}
