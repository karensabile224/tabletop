//
//  SelectionImagePicker.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/25/25.
//

import SwiftUI
import PhotosUI

struct SelectionImagePicker: View {
    
    @EnvironmentObject var userInfo: UserInfoModel

    @State private var isConfirmationDialogPresented: Bool = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image? = Image("plate")
    @State private var showCamera: Bool = false
    @State private var showLibrary: Bool = false
    
    var body: some View {
        Button {
            isConfirmationDialogPresented.toggle()
        } label: {
            ZStack {
                if userInfo.profilePhoto == Image("plate") {
                    ZStack {
                        userInfo.profilePhoto
                            .resizable()
                            .frame(width: 225, height: 225)
                        Text("tap to upload \n a profile photo")
                            .foregroundStyle(.black)
                    }
                } else {
                    userInfo.profilePhoto
                        .resizable()
                        .frame(width: 215, height: 215)
                        .clipShape(.circle)
                        .padding(7)
                }
            }.offset(y: -70)
        }.confirmationDialog("Select a profile photo", isPresented: $isConfirmationDialogPresented) {
            Button("Take a photo") {
                showCamera = true
                showLibrary = false
            }
            Button("Choose from library") {
                showCamera = false
                showLibrary = true
            }
            Button("Delete photo") {
                selectedImage = Image("plate")
                userInfo.profilePhoto = Image("plate")
            }
            Button("Cancel", role: .cancel) {}
        }
        .sheet(isPresented: $showCamera) {
            CameraView()
        }
        .photosPicker(isPresented: $showLibrary, selection: $selectedItem, matching: .images)
        .onChange(of: selectedItem) {
            Task {
                selectedImage = try await selectedItem?.loadTransferable(type: Image.self)
                userInfo.profilePhoto = selectedImage!
            }
        }
    }
}
