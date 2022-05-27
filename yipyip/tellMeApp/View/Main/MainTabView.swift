//
//  MainTabView.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel: AuthViewmodel
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex){
                    ConversationView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem { Image(systemName: "bubble.left")}
                        .tag(0)
                    
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem { Image(systemName: "gear")}
                        .tag(1)
                }
                .navigationTitle(tabTitle)
            }
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Settings"
        default: return ""
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewInterfaceOrientation(.portrait)
    }
}
