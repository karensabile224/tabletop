//
//  CameraView.swift
//  Tabletop
//
//  Created by Karen Sabile on 8/25/25.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var userInfo: UserInfoModel

    @State private var selectedImage: Image? = Image("plate")

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.cameraCaptureMode = .photo
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
}

#Preview {
    CameraView()
}
