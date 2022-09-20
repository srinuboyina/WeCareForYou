//
//  Login.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

struct Login: Identifiable, Codable, BaseResponse {
    var id: UUID
    var userName: String

    init(id: UUID = UUID(), userName: String = "") {
        self.id = id
        self.userName = userName
    }
}
