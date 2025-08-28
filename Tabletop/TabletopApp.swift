//
//  TabletopApp.swift
//  Tabletop
//  Main file for launching Tabletop app.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

@main
struct TabletopApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @State private var authController = AuthController()
    @StateObject var userInfo = UserInfoModel(name: "", email: "", username: "", password: "", profilePhoto: Image("plate"))
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environment(authController)
                .environmentObject(userInfo)
        }
    }
}
