//
//  PostCard.swift
//  Tabletop
//  Template view file for user posts.
//
//  Created by Karen Sabile on 8/29/25.
//

import SwiftUI

struct PostCard: View {
    let profilePhotoName: String
    let username: String
    let postImageName: String
    let numLikes: Int
    let numComments: Int
    let caption: String
    
    var body: some View {
        VStack {
            HStack {
                Image(profilePhotoName)
                    .resizable()
                    .frame(width: 35, height: 35)
                
                Text(username)
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("steam")
            }
            .background(.black)
            .padding(.leading)
            .padding(.trailing)
            
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                    .frame(maxWidth: .infinity)
                    .frame(height: 275)
                    .padding(EdgeInsets(top: -10, leading: 0, bottom: 0, trailing: 0))
                
                Image(postImageName)
                    .resizable()
                    .frame(width: .infinity, height: 450, alignment: .center)
                    .padding(EdgeInsets(top: -10, leading: 20, bottom: 0, trailing: 20))
            }
            
            HStack {
                Text(caption)
                    .font(.system(size: 15))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("whisk")
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 30))
            
            
        }
    }
}

#Preview {
    PostCard(profilePhotoName: "plate", username: "username", postImageName:"placeholder", numLikes: 20, numComments: 3, caption: "hey man check out my post!")
}
