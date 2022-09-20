//
//  CreateProfile.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import Foundation

struct CreateProfile: Identifiable, Codable, BaseResponse {
    var id: UUID
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}
