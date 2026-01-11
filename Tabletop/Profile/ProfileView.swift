//
//  ProfileViewController.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/22/25.
//
//  View for accessing and/or editing user profile information.

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userInfo: UserInfoModel
    
    var body: some View {
        VStack {
            ZStack {
                Image("wood")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                Rectangle()
                    .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                    .frame(maxWidth: .infinity)
                    .frame(height: 125)
                    .offset(y: -150)
                
                VStack {
                    ZStack {
                        userInfo.profilePhoto
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(.circle)
                            .padding(15)
                            .offset(y:-150)
                        
                        Text("@" + userInfo.username)
                            .frame(width: 350, height: 20, alignment: .center)
                            .foregroundStyle(.white)
                            .font(Font.custom("Proxima Nova Light", size: 18))
                            .offset(y: -30)
                        
                        NavigationLink(destination: EditProfileView()) {
                            Text("edit profile")
                                .frame(width: 125, height: 25, alignment: .center)
                                .background(Capsule().fill(.white))
                                .font(Font.custom("Proxima Nova Light", size: 15))
                        }.offset(y: 20)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
