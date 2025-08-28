//
//  FeedViewController.swift
//  Tabletop
//  View for users to scroll through their friends' posts.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
        }
    }
        
}

#Preview {
    SearchView()
}
