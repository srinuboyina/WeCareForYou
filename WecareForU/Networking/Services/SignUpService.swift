//
//  SignUpService.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 20/04/22.
//

import Foundation

protocol SignUpServiceProtocol {
    func signUp(requestParams: [String: Any], completion: @escaping (SignUp?, NetworkingError?) -> ())
}

class SignUpService: SignUpServiceProtocol {
    func signUp(requestParams: [String : Any], completion: @escaping (SignUp?, NetworkingError?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            completion(SignUp(), nil)
        }
    }
}
