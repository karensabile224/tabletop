//
//  PhotoLibraryView.swift
//  Tabletop
//  View that enables users to upload a profile photo from their photo library.
//
//  Created by Karen Sabile on 8/25/25.
//

import SwiftUI
import PhotosUI

struct PhotoLibraryView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfoModel
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image? = Image("plate")
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) { }
            .onChange(of: selectedItem) {
            Task {
                selectedImage = try await selectedItem?.loadTransferable(type: Image.self)
                userInfo.profilePhoto = selectedImage!
            }
        }
    }
}

#Preview {
    PhotoLibraryView()
}
