//
//  SignUp.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 20/04/22.
//

import Foundation

struct SignUp: Identifiable, Codable, BaseResponse {
    var id: UUID
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}
