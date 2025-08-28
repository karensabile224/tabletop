//
//  TabletopApp.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

@main
struct TabletopApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
//    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @State private var authController = AuthController()
    @StateObject var userInfo = UserInfoModel(name: "", email: "", username: "", password: "", profilePhoto: Image("plate"))
    
    var body: some Scene {
        WindowGroup {
//            NavigationView {
            AuthView()
                .environment(authController)
                .environmentObject(userInfo)
//            }
//            .environmentObject(userAuth)
        }
    }
}
