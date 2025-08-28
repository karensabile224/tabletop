//
//  ViewController.swift
//  Tabletop
//  View for navigation between Tabletop tabs.
//
//  Created by Karen Sabile on 7/14/25.
//

import SwiftUI

struct TabBarView: View {
    @State var selection: Int = 4
    @EnvironmentObject var userInfo: UserInfoModel
    
    // color customization (source: stackoverflow)
    init() {
        // source: https://medium.com/@sama3l/customizing-the-default-swiftui-tabbar-colors-fonts-and-backgrounds-37e02a78b1b6
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(red: 0.36, green: 0.15, blue: 0.06, alpha: 1.00)
        
        let itemAppearance = tabBarAppearance.stackedLayoutAppearance
        itemAppearance.selected.iconColor = UIColor(red: 0.70, green: 0.51, blue: 0.26, alpha: 1.00)
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(red: 0.70, green: 0.51, blue: 0.26, alpha: 1.00), .font: UIFont(name: "OPTIGleam-Light", size: 10)!]
        
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(.white), .font: UIFont(name: "OPTIGleam-Light", size: 10)!]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        self.selection = 2
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView().tabItem {
                Image("friends-icon").renderingMode(.template)
                Text("Friends")
                    .bold()
            }.tag(0)
            
            SearchView().tabItem {
                Image("search-icon").renderingMode(.template)
                Text("Search")
                    .bold()
            }.tag(1)
            
            CreateView().tabItem {
                Image("create-icon").renderingMode(.template)
                Text("Create")
                    .bold()
            }.tag(2)
            
            CollectionsView().tabItem {
                Image("collections-icon").renderingMode(.template)
                Text("Collections")
                    .bold()
            }.tag(3)
            
            ProfileView().tabItem {
//                userInfo.profilePhoto
                Text("Profile")
                    .bold()
            }.tag(4)
        }
        .background(Color(red: 0.36, green: 0.15, blue: 0.06))
        .navigationBarBackButtonHidden(true)
        .tint(Color(red: 0.68, green: 0.51, blue: 0.26))
        .tabViewStyle(.sidebarAdaptable)
        .environmentObject(userInfo)
    }
}

#Preview {
    TabBarView()
}
