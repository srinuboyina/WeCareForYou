//
//  ForgotPasswordViewModel.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import Foundation

protocol ForgotPasswordDataBindProtocol: ObservableObject {
    var username: String { get set }
}

protocol ForgotPasswordViewModelProtocol: ObservableObject {
    var response: ForgotPassword? { get set }
    func sentVerificationEmail()
}

final class ForgotPasswordViewModel: ForgotPasswordViewModelProtocol,
                                     ForgotPasswordDataBindProtocol,
                                     APILoadingStateProtocol
{
   
    var response               : ForgotPassword?
    @Published var username    : String = ""
    @Published var isLoading   : Bool   = false
    @Published var hasError    : Bool   = false
    private let service        : ForgotPasswordServiceProtocol
    
    init(_ service: ForgotPasswordServiceProtocol = ForgotPasswordService(),
         response: ForgotPassword? = nil)
    {
        self.service = service
        self.response = response
    }
    
    func sentVerificationEmail() {
        service.sendVerificationLink(requestParams: builParams()) { [weak self] response, errorr in
            if errorr == nil {
                self?.isLoading = false
                self?.response = response
            }else {
                self?.isLoading = false
                self?.hasError  = true
            }
        }
    }
    
    func builParams() -> [String: Any] {
        let params = ["username": username]
        return params
    }
    
}
