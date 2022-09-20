//
//  CreateProfileService.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import Foundation

protocol CreateProfileServiceProtocol {
    func create(requestParams: [String: Any], completion: @escaping (CreateProfile?, NetworkingError?) -> ())
}

final class CreateProfileService: CreateProfileServiceProtocol {
    func create(requestParams: [String : Any], completion: @escaping (CreateProfile?, NetworkingError?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            completion(CreateProfile(), nil)
        }
    }
}
