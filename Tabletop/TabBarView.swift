//
//  ViewController.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/14/25.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selection: Int = 2
    
    // color customization (source: stackoverflow)
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 0.36, green: 0.15, blue: 0.06, alpha: 1.00)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor(red: 0.68, green: 0.51, blue: 0.26, alpha: 1.00)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView().tabItem {
                if selection == 0 {
                    Image("friends-icon")
                } else {
                    Image("friends-icon")
                }
                Text("Friends")
            }
            
            SearchView().tabItem {
                Image("search-icon")
                Text("Search")
            }
            
            CreateView().tabItem {
                Image("create-icon")
                Text("Create")
            }
            
            CollectionsView().tabItem {
                Image("collections-icon")
                Text("Collections")
            }
            
            ProfileView().tabItem {
                Image("profile-icon")
                Text("Profile")
            }
        }
        .tint(Color(red: 0.68, green: 0.51, blue: 0.26))
        .tabViewStyle(.sidebarAdaptable);
        
    }
}
    
#Preview {
    TabBarView()
}
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        UITabBar.appearance().backgroundColor = UIColor(red: 0.36, green: 0.15, blue: 0.06, alpha: 1.00)        // dark brown background
//        
//        // setting custom tab bar colors using helper function below
//        // source: https://www.dice.com/career-advice/using-uitabbarappearance-tab-bar-changes-ios-13
//        let appearance = UITabBarAppearance()
//        setTabBarItemColors(appearance.stackedLayoutAppearance)
//        setTabBarItemColors(appearance.inlineLayoutAppearance)
//        setTabBarItemColors(appearance.compactInlineLayoutAppearance)
//        
//        self.viewControllers = [
//            createNavController(for: FeedViewController(), title: "Friends", image: UIImage(named: "friends-icon")!),
//            createNavController(for: SearchViewController(), title: "Search", image: UIImage(named: "search-icon")!),
//            createNavController(for: PlateViewController(), title: "Create", image: UIImage(named: "post-icon")!),
//            createNavController(for: CollectionsViewController(), title: "Collections", image: UIImage(named: "collections-icon")!),
//            createNavController(for: ProfileViewController(), title: "Profile", image: nil)]
//        
//        self.selectedViewController = viewControllers![2]
//    }
//    
//    @available(iOS 13.0, *)
//        private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
//            itemAppearance.normal.iconColor = .white
//            itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            
//            itemAppearance.selected.iconColor = UIColor(red: 0.68, green: 0.51, blue: 0.26, alpha: 1.00)
//            itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.51, blue: 0.26, alpha: 1.00)]
//        }
//    
//    // populate tab bar with child views (source: medium.com)
//    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        let navController = UINavigationController(rootViewController: rootViewController)
//        if image != nil {
//            navController.tabBarItem.image = image
//        }
//        navController.tabBarItem.title = title
//        navController.tabBarItem.badgeColor = UIColor(red: 0.68, green: 0.51, blue: 0.26, alpha: 1.00)
//        return navController
//    }

