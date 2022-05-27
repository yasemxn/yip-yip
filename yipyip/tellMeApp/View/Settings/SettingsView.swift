//
//  SettingsView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct SettingsView: View {
    
    private let user:User
    
    init(user: User) {
        self.user = user
    }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                NavigationLink(
                    destination: ProfileEditView(user: user),
                    label: { SettingsHeaderView(user: user) })
                
                
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                Button(action: {
                    AuthViewmodel.shared.signOut()
                }, label: {
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                Spacer()
            }
           
        }
    }
}



