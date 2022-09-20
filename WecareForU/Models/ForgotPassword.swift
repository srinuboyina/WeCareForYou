//
//  ForgotPassword.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

struct ForgotPassword: Identifiable, Codable, BaseResponse {
    var id: UUID
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}
