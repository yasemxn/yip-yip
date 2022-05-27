//
//  AuthViewModel.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import Firebase
import UIKit
import ProgressHUD

class AuthViewmodel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var hasError = false
    @Published var alertMessage = ""
    private var tempCurrentUser: FirebaseAuth.User?
    
    
    
    static let shared = AuthViewmodel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        
        fetchCurrentUser()
    }
    func signIn(withEmail email: String, password: String) {

        Auth.auth().signIn(withEmail: email, password: password) { result , error in
            if let error = error {
                print("Failed to sign in with error: \(error.localizedDescription)")
                ProgressHUD.showFailed("Failed to sign in with error: \(error.localizedDescription)")
                return
            }

            self.userSession = result?.user
            self.fetchCurrentUser()
            
        }
        
        
    }
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to create an user with error: \(error.localizedDescription)")
                ProgressHUD.showFailed("Failed to create an user with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempCurrentUser = user
            
            
            let data: [String: Any] = ["email": email,
                                       "username": username,
                                       "fullname": fullname]
            //"status": UserStatus.noStatus.rawValue
            
            COLLECTION_USERS.document(user.uid).setData(data) {_ in
                self.didAuthenticateUser = true
            }
        }
    }
    
    func uploadPhoto(_ image: UIImage) {
        guard let uid = tempCurrentUser?.uid else { return }
        
        ImageUploader.uploadToStorage(imageStorage: image) { imageUrl in
            COLLECTION_USERS.document(uid).updateData(
                ["profileImageUrl": imageUrl]) { _ in
                    self.userSession = self.tempCurrentUser
                }
        }
    }
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
        
    }
    
    func fetchCurrentUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument {  snapshot, _ in
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
        
    }
}
