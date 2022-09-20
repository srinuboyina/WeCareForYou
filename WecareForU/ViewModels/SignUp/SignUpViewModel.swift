//
//  SignUpViewModel.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

protocol SignUpDataBindProtocol: ObservableObject {
    var username            : String { get set }
    var password            : String { get set }
    var confirmPassword     : String { get set }
}

protocol SignUpViewModelProtocol: ObservableObject {
    var response     : SignUp? { get set }
    func signUp()
}

final class SignUpViewModel: SignUpViewModelProtocol,
                             SignUpDataBindProtocol,
                             APILoadingStateProtocol {
    
    @Published var username: String         = ""
    @Published var password: String         = ""
    @Published var confirmPassword: String  = ""
    @Published var isLoading: Bool          = false
    @Published var hasError: Bool           = false
    @Published var response    : SignUp?
    private    let service     : SignUpServiceProtocol
    
    init(_ service: SignUpServiceProtocol = SignUpService(),
         response: SignUp? = nil)
    {
        self.service = service
        self.response = response
    }
    
    func isValidated() -> Bool {
        if password != confirmPassword {
            return false
        }
        let isValidUserName = username.isValidUserName
        let isValidPassword = password.isValidPassword
        let isValidConfirmPassword = confirmPassword.isValidPassword
        guard !username.isEmpty, isValidUserName else { return false }
        guard !password.isEmpty, isValidPassword else { return false }
        guard !confirmPassword.isEmpty, isValidConfirmPassword else { return false }
        return isValidUserName && isValidPassword
    }
    
    func signUp() {
        guard isValidated() else {
            return
        }
        self.isLoading = true
        service.signUp(requestParams: builParams()) { [weak self] response, errorr  in
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
        let params = ["username": username,
                      "password": password,
                      "confirmpassword": confirmPassword]
        return params
    }
    
}
