//
//  ForgotPasswordService.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

protocol ForgotPasswordServiceProtocol {
    func sendVerificationLink(requestParams: [String: Any], completion: @escaping (ForgotPassword?, NetworkingError?) -> ())
}

class ForgotPasswordService: ForgotPasswordServiceProtocol {
    
    func sendVerificationLink(requestParams: [String: Any], completion: @escaping (ForgotPassword?, NetworkingError?) -> ()) {
        //TODO: replace this with firebase
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            completion(ForgotPassword(), nil)
        }
    }
    
}
