//
//  AuthController.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/23/25.
//  source: https://www.youtube.com/watch?v=zGp4UFlXKR8

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

@Observable
class AuthController {
    var authState: AuthState = .undefined
    
    func startListeningToAuthState() async {
        Auth.auth().addStateDidChangeListener { _, user in
            self.authState = user != nil ? .authenticated : .notAuthenticated
        }
    }
    
    @MainActor
    func signIn() async throws {
        guard let rootVC = UIApplication.shared.firstKeyWindow?.rootViewController else { return }
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
        guard let idToken = result.user.idToken?.tokenString else { return }
        let accessToken = result.user.accessToken
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken.tokenString)
        
        try await Auth.auth().signIn(with: credential)
    }
    
    func signOut() async throws {
        try Auth.auth().signOut()
    }
}

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap{ $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.windows
            .first(where: \.isKeyWindow)
    }
}
