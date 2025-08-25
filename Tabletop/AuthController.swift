//
//  AuthController.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/23/25.
//

import SwiftUI

@Observable
class AuthController {
    var authState: AuthState = .undefined
    
    func startListeningToAuthState() async {
        
    }
    
    @MainActor
    func signIn() async throws {
        
    }
    
    func signOut() async throws {
        
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
