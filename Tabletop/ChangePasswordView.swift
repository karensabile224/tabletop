//
//  ChangePasswordView.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/24/25.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userInfo: UserInfoModel

    @State var newPassword: String = ""
    @State var confirmedPassword: String = ""

    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack {
                SecureField("new password", text:$newPassword)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(10)
                    .background(Capsule().fill(.white))
                    .offset(y:-25)
                    .textInputAutocapitalization(.never)
                
                SecureField("confirm password", text:$confirmedPassword)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(10)
                    .background(Capsule().fill(.white))
                    .offset(y:-10)
                    .textInputAutocapitalization(.never)
                
                if !confirmedPassword.isEmpty && confirmedPassword != userInfo.password {
                    Text("Passwords must match")
                        .font(Font.custom("OPTIGleam-Light", size: 10))
                        .foregroundStyle(.red)
                        .frame(width: 325, height: 5, alignment: .leading)
                        .offset(y:15)
                }
                
                Button(action: {
                    userInfo.password = confirmedPassword
                    dismiss()
                }) {
                    Text("save")
                        .frame(width: 125, height: 20)
                        .padding(10)
                        .background(Color(red: 0.70, green: 0.51, blue: 0.26))
                        .foregroundStyle(.white)
                        .font(Font.custom("OPTIGleam-Light", size: 15))
                        .clipShape(.capsule)
                        .bold()
                }.offset(y: 30)
            }
            .environment(\.font, Font.custom("OPTIGleam-Light", size: 15))
            .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss() // Or handle navigation path manipulation
                        }) {
                            HStack {
                                Image("back-arrow")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                Text("Back")
                                    .font(Font.custom("OPTIGleam-Light", size: 15))
                            }.foregroundStyle(.white)
                        }
                    }
                }
            
        }
    }
}
