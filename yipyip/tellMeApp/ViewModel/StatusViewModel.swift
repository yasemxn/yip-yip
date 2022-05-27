//
//  StatusViewModel.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 15.05.2022.
//

import SwiftUI

class StatusViewModel: ObservableObject {
    @Published var status: UserStatus = .noStatus
    
    func updateStatus(status: UserStatus) {
        self.status = status
    }
    
}


enum UserStatus: Int, CaseIterable { // Codable 
    case noStatus
    case available
    case busy
    case school
    case work
    case movies
    case battery
    case sleeping
    case sosCalls
    
    var title: String {
        switch self {
        case .noStatus: return "Click here to update your status."
        case .available: return "Available"
        case .busy: return "Busy"
        case .school: return "At school"
        case .work: return "At work"
        case .movies: return "At the movies"
        case .battery: return "Battery is about to die"
        case .sleeping: return "Sleeping zzz..."
        case .sosCalls: return "Urgent calls only."
    }
}
}
