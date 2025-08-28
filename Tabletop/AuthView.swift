//
//  AuthPage.swift
//  Default page for new/returning users to create an account or log back into Tabletop.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var userInfo: UserInfoModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wood")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                Rectangle()
                    .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .offset(y: -110)
                
                VStack {
                    ZStack {
                        Image("plate")
                            .resizable()
                            .frame(width: 350, height: 350, alignment: .center)
                        
                        Text("t a b l e t o p")
                            .font(Font.custom("OPTIGleam-Light", size: 40))
                            .bold()
                    }.offset(y:-50)
                    
                    NavigationLink {
                        LoginView()
                            .environmentObject(userInfo)
                    } label: {
                        Text("log in")
                            .padding(.init(top: 10, leading: 130, bottom: 10, trailing: 130))
                            .tint(.black)
                            .background(.white)
                            .clipShape(.capsule)
                            .font(Font.custom("OPTIGleam-Light", size: 15))
                            .bold()
                    }
                    
                    NavigationLink {
                        SignUpView()
                            .environmentObject(userInfo)
                    } label: {
                        Text("sign up")
                            .padding(.init(top: 10, leading: 125, bottom: 10, trailing: 125))
                            .tint(.black)
                            .background(Color(red: 0.70, green: 0.51, blue: 0.26))
                            .clipShape(.capsule)
                            .font(Font.custom("OPTIGleam-Light", size: 15))
                            .bold()
                    }.offset(y:15)
                }
            }
        }
    }
}

#Preview {
    AuthView()
}
