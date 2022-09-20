//
//  NetworkError.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

enum NetworkingError: LocalizedError {
    case deviceIsOffline
    case unauthorized
    case resourceNotFound
    case serverError(Error)
    case missingData
    case decodingFailed(Error)
}
