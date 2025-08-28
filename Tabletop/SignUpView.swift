//
//  SignUpView.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/23/25.
//
//  View for users to create a new Tabletop account.

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss

    // source: https://www.youtube.com/watch?v=zGp4UFlXKR8
    @Environment(AuthController.self) private var authController
    @EnvironmentObject var userInfo: UserInfoModel
    
    @State var confirmedPassword: String = ""
    
    var body: some View {
        Group {
        switch authController.authState {
            case .authenticated:
                TabBarView()
                    .environmentObject(userInfo)
            default:
                ZStack {
                    Image("wood")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea(.all)
                    
                    Rectangle()
                        .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                        .frame(maxWidth: .infinity)
                        .frame(height: 125)
                        .offset(y: -255)
                    
                    VStack {
                        // give user option to upload profile photo from camera or photo library
                        SelectionImagePicker()
                        
                        TextField("your name", text:$userInfo.name)
                            .frame(width: 325, height: 20)
                            .padding(10)
                            .background(Capsule().fill(.white))
                            .offset(y:-50)
                            .textInputAutocapitalization(.never)
                        
                        TextField("your email", text:$userInfo.email)
                            .frame(width: 325, height: 20, alignment: .center)
                            .padding(10)
                            .background(Capsule().fill(.white))
                            .offset(y:-35)
                            .textInputAutocapitalization(.never)
                        
                        TextField("username", text:$userInfo.username)
                            .frame(width: 325, height: 20, alignment: .center)
                            .padding(10)
                            .background(Capsule().fill(.white))
                            .offset(y:-20)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("password", text:$userInfo.password)
                            .frame(width: 325, height: 20, alignment: .center)
                            .padding(10)
                            .background(Capsule().fill(.white))
                            .offset(y:-5)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("confirm password", text:$confirmedPassword)
                            .frame(width: 325, height: 20, alignment: .center)
                            .padding(10)
                            .background(Capsule().fill(.white))
                            .offset(y:10)
                            .textInputAutocapitalization(.never)
                        
                        if !confirmedPassword.isEmpty && confirmedPassword != userInfo.password {
                            Text("Passwords must match")
                                .font(Font.custom("OPTIGleam-Light", size: 10))
                                .foregroundStyle(.red)
                                .frame(width: 325, height: 5, alignment: .leading)
                                .offset(y:15)
                        }
                        
                        NavigationLink(destination: TabBarView().environmentObject(userInfo)) {
                            Text("sign up")
                                .padding(.init(top: 10, leading: 130, bottom: 10, trailing: 130))
                                .tint(.black)
                                .background(Color(red: 0.70, green: 0.51, blue: 0.26))
                                .clipShape(.capsule)
                                .bold()
                        }
                        .offset(y:35)
                        .disabled(userInfo.name.isEmpty || userInfo.email.isEmpty || userInfo.username.isEmpty || userInfo.password.isEmpty || confirmedPassword != userInfo.password)
                        
                        Text("OR")
                            .foregroundStyle(.white)
                            .offset(y:45)
                        
                        //                    GoogleSignInButton(scheme: .light, style: .standard, state: .normal) {
                        //                        googleSignUp()
                        //                    }
                        Button(action: googleSignUp) {
                            Text("sign up with Google")
                                .padding(10)
                                .tint(.black)
                                .background(.white)
                                .clipShape(.capsule)
                                .bold()
                        }.offset(y:50)
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
        }.task {
            await authController.startListeningToAuthState()
        }
    }
    
    @MainActor
    func googleSignUp() {
        Task {
            do {
                try await authController.signIn()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    SignUpView()
}
