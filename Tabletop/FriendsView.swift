//
//  FeedViewController.swift
//  Tabletop
//  View for users to scroll through their friends' posts.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var jsonReader = JsonDataReader()
    
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack {
                ForEach(jsonReader.posts) { post in
                    PostCard(profilePhotoName: post.profilePhotoName, username: post.username, postImageName: post.postImageName, numLikes: post.numLikes, numComments: post.numComments, caption: post.caption)
                }
                .padding(.top)
            }
        }
    }
        
}

#Preview {
    SearchView()
}
