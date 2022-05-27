//
//  ImageUploader.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadToStorage(imageStorage: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = imageStorage.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to upload image with error: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    
    }
}
