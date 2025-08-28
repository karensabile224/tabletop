//
//  LoginView.swift
//  Tabletop
//  View for users to sign in to an existing Tabletop account.
//
//  Created by Karen Sabile on 7/23/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(AuthController.self) private var authController
    @EnvironmentObject var userInfo: UserInfoModel

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            Rectangle()
                .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .offset(y: -200)
            
            VStack {
                ZStack {
                    Image("plate")
                        .resizable()
                        .frame(width: 275, height: 275, alignment: .center);
                    
                    Text("t a b l e t o p")
                        .font(Font.custom("OPTIGleam-Light", size: 25))
                        .bold()
                }.offset(y:-80)
                
                TextField("username/email", text:$username)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(13)
                    .background(Capsule().fill(.white))
                    .offset(y:-40)
                    .textInputAutocapitalization(.never)
                
                SecureField("password", text:$password)
                    .frame(width: 325, height: 20, alignment: .center)
                    .padding(13)
                    .background(Capsule().fill(.white))
                    .offset(y:-25)
                    .textInputAutocapitalization(.never)
                
                NavigationLink {
                    TabBarView()
                        .environmentObject(userInfo)
                } label: {
                    Text("log in")
                        .padding(.init(top: 10, leading: 130, bottom: 10, trailing: 130))
                        .tint(.black)
                        .background(Color(red: 0.70, green: 0.51, blue: 0.26))
                        .clipShape(.capsule)
                        .bold()
                }
                .offset(y:30)
                .disabled(username == "" || password == "")
                .alert(isPresented: $showAlert) {
                            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Try Again")))
                        }
                
                Text("OR")
                    .foregroundStyle(.white)
                    .offset(y:45)
                
                Button(action: googleLogin) {
                    Text("log in with Google")
                        .padding(10)
                        .tint(.black)
                        .background(.white)
                        .clipShape(.capsule)
                        .bold()
                }.offset(y:55)
            }
        }
        .environment(\.font, Font.custom("OPTIGleam-Light", size: 15))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
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
    
    fileprivate func login() {
        if username.isEmpty {
            showAlert = true
            alertTitle = "Invalid credentials"
            alertMessage = "Please enter a valid username or email."
        } else if password.isEmpty {
            showAlert = true
            alertTitle = "Error"
            alertMessage = "Incorrect password."
        } else {
            showAlert = false
        }
    }
    
    fileprivate func googleLogin() {
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
    LoginView()
}
