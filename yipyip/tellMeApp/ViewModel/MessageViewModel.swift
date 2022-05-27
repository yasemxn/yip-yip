//
//  MessageViewModel.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import Foundation

struct MessageViewModel {
    
    let message: Message
    
 
    var currentUid: String {
        return AuthViewmodel.shared.userSession?.uid ?? ""
    }
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else {
            return nil
        }

        return URL(string: profileImageUrl)
    }
}
