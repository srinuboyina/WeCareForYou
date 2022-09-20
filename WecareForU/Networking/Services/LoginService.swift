//
//  LoginService.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

protocol LoginServiceProtocol {
    func login(requestParams: [String: Any], completion: @escaping (Login?, NetworkingError?) -> ())
}

class LoginService: LoginServiceProtocol {
    
    func login(requestParams: [String: Any], completion: @escaping (Login?, NetworkingError?) -> ()) {
        //TODO: replace this with firebase
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            completion(Login(), nil)
        }
    }
    
}
