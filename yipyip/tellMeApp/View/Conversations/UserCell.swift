//
//  UserCell.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    Text(user.username)
                        .font(.system(size: 15))
                    
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}
