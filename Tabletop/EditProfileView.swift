//
//  EditProfileView.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/23/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userInfo: UserInfoModel
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image? = Image("plate")
    
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            Rectangle()
                .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                .frame(maxWidth: .infinity)
                .frame(height: 125)
                .offset(y: -225)
            
            VStack {
                SelectionImagePicker()
                
                Text("Name")
                    .frame(width: 325, height: 20, alignment: .leading)
                    .foregroundStyle(.white)
                    .offset(y:-75)
                    
                TextField(userInfo.name, text: $userInfo.name)
                    .frame(width: 325, height: 20)
                    .padding(10)
                    .background(Capsule().fill(.white))
                    .offset(y:-70)
                    .textInputAutocapitalization(.never)
                
                Text("Email")
                    .frame(width: 325, height: 20, alignment: .leading)
                    .foregroundStyle(.white)
                    .offset(y: -55)
                
                TextField(userInfo.email, text:$userInfo.email)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(10)
                    .background(Capsule().fill(.white))
                    .offset(y:-50)
                    .textInputAutocapitalization(.never)
                
                Text("Username")
                    .frame(width: 325, height: 20, alignment: .leading)
                    .foregroundStyle(.white)
                    .offset(y: -35)
                
                TextField(userInfo.username, text:$userInfo.username)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(10)
                    .background(Capsule().fill(.white))
                    .offset(y:-30)
                    .textInputAutocapitalization(.never)
                
                NavigationLink {
                    ChangePasswordView()
                        .environmentObject(userInfo)
                } label: {
                    Text("change password")
                        .frame(width: 200, height: 20)
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(.black)
                        .font(Font.custom("OPTIGleam-Light", size: 15))
                        .clipShape(.capsule)
                        .bold()
                }.offset(y: 10)
                
                Button(action: {
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
                        .offset(y: 25)
                }
            }
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

#Preview {
    EditProfileView()
}
