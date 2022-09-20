//
//  AccountOptions.swift
//  WecareForU
//
//  Created by apple on 4/27/22.
//

import Foundation
import SwiftUI

enum Options: String, Codable {
    case profile = "profile"
    case bookings = "bookings"
    case donation = "donation"
    case notifications = "notifications"
    case changeLanguage = "changeLanguage"
    case faq = "faq"
    case feedback = "feedback"
    case logout = "logout"
}

struct AccountOptions: Identifiable, Equatable, Codable {
    var id: String {
        return name
    }
    let name: String
    let image: String
   
    init(name: String, imageName: String)
    {
        self.name      = name
        self.image = imageName
    }
    
}
