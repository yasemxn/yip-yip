//
//  ProfileEditView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct ProfileEditView: View {
    
    @State private var fullname = "Yasemin Karaca"
    @State private var showImagePicker = false
    @State private var image: UIImage?
    @State private var profileImage: Image?
//    @ObservedObject var viewModel: ProfileEditViewModel
    
    let user:User
//
//    init(user: User) {
//        self.user = user
//        self.viewModel = ProfileEditViewModel(user)
//    }
//
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 44) {
                VStack {
                    HStack {
                        
                        VStack {
                            
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                                
                            }
                            
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("edit")
                            })
                            .sheet(isPresented: $showImagePicker, onDismiss: updateImage) {
                                ImagePicker(image: $image )
                            }
                        }
                        .padding(.top)
                        Text("Enter your name or change your profile photo.")
                            .font(.system(size:16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                    }
                    Divider()
                        .padding(.horizontal)
                    TextField("", text: $fullname)
                        .padding(8)
                       
                }
             
                .background(Color.white)
                
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                    NavigationLink(
                        destination: SelectStatusView(),
                        label: {
                            HStack {
                            Text("Busy")
                            Spacer()
                            Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                        }
                        .padding()
                    .background(Color.white)
                        
                    })
                }
                Spacer()
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    func updateImage() {
        guard let image = image else { return }
        profileImage = Image(uiImage: image)
    }

}

