//
//  BaseResponse.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

protocol BaseResponse: Identifiable, Codable {
    var id: UUID { get set }
}
