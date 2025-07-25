//
//  TabletopApp.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

@main
struct TabletopApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
//    @StateObject var userAuth: UserAuthModel =  UserAuthModel()
    
    var body: some Scene {
        WindowGroup {
//            NavigationView {
                AuthPage()
//            }
//            .environmentObject(userAuth)
        }
    }
}

#Preview {
    TabletopApp()
}
