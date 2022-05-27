//
//  SettingsCellViewModel.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

enum SettingsCellViewModel: Int, CaseIterable {
    
    case account
    case notifications

    
    var title: String {
        switch self {
        case .account: return "Account"
        case .notifications: return "Notifications"

        }
    }
    
    var imageName: String {
        switch self {
        case .account: return "key.fill"
        case .notifications: return "bell.badge.fill"

        }
    }

}
