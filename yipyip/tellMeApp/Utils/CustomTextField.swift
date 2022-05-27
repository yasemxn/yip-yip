//
//  CustomTextField.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing:16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                        .autocapitalization(.none)
                } else {
                    TextField(placeholderText, text: $text)
                        .autocapitalization(.none)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

