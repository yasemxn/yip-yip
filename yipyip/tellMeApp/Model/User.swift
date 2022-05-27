//
//  User.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
//    var status: UserStatus
    
}

let MOCK_USER = User(id: "1233454", username: "test12", fullname: "test", email: "test@gmail.com", profileImageUrl: "www.google.com") //status: .available
