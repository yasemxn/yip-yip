//
//  ConversationCell.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel
    
    
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(destination: ChatsView(user:user)) {
                VStack {
                    HStack {
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.fullname)
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                            
                        }.foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()
                    
                }
                .padding(.top)
            }
            
        }
      
    }
}
