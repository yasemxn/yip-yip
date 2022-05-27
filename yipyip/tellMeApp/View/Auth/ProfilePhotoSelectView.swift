//
//  ProfilePhotoSelectView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import SwiftUI

struct ProfilePhotoSelectView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewmodel
    
    var body: some View {
        VStack {
            Button(action: {
                imagePickerPresented.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                    
                }
            })
            
            .sheet(isPresented: $imagePickerPresented,onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })
            
            Text(profileImage == nil ? "Select a profile photo" :
            "Great! Tap below to continue.")
            .font(.system(size: 20, weight: .semibold))
            
            if let image = selectedImage {
                Button(action: {
                    viewModel.uploadPhoto(image)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                    
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
            }
            Spacer()
            
        }
        
        .navigationBarBackButtonHidden(true)
    }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}
        

struct ProfilePhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectView()
    }
}
