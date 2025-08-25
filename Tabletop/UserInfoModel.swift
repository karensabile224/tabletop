//
//  UserProfile.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/23/25.
//

import SwiftUI

class UserInfoModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var profilePhoto: Image = Image("plate")
    
    init(name: String, email: String, username: String, password: String, profilePhoto: Image) {
        self.name = name
        self.email = email
        self.username = username
        self.password = password
        self.profilePhoto = profilePhoto
    }
}
