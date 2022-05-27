//
//  ChatViewModel.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewmodel.shared.userSession?.uid else { return }
        guard let chatPartnerUid = user.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(chatPartnerUid)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener{ snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added
            }) else { return }
            var messages = changes.compactMap { try? $0.document.data(as: Message.self)}
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
            self.messages.append(contentsOf: messages)
        }
        
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            var messages = documents.compactMap { try? $0.data(as: Message.self)}
            
            for (index, message) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = self.user
            }
            self.messages = messages
        }
        
    }
   
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewmodel.shared.userSession?.uid else { return }
        guard let chatPartnerUid = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(chatPartnerUid).document()
        
        let chatPartnerRef = COLLECTION_MESSAGES.document(chatPartnerUid).collection(currentUid)
        
        let recentCurrentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages").document(chatPartnerUid)
        let recentPartnerRef = COLLECTION_MESSAGES.document(chatPartnerUid).collection("recent-messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = ["text" : messageText,
                                   "fromId": currentUid,
                                   "toId": chatPartnerUid,
                                   "read": false,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        chatPartnerRef.document(messageId).setData(data)
        
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
        
        
    }
    
}
