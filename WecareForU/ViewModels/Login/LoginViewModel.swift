//
//  LoginViewModel.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

//protocol ErrorProtocol: ObservableObject {
//    var isError: NetworkingError { get set }
//}
//
protocol APILoadingStateProtocol: ObservableObject {
    var isLoading    : Bool   { get set }
    var hasError     : Bool   { get set }
}

protocol LoginDataBindProtocol: ObservableObject {
    var username     : String { get set }
    var password     : String { get set }
}

protocol LoginViewModelProtocol: ObservableObject {
    var isEmailValid : Bool   { get set }
    var response     : Login? { get set }
    
    func isValidated() -> Bool
    func signIn()
    func builParams() -> [String: Any]
}

final class LoginViewModel: LoginViewModelProtocol,
                            LoginDataBindProtocol,
                            APILoadingStateProtocol
{
    
    @Published var isEmailValid: Bool   = false
    @Published var isLoading   : Bool   = false
    @Published var hasError    : Bool   = false
    @Published var username    : String = ""
    @Published var password    : String = ""
    @Published var response    : Login?
    private    let service     : LoginServiceProtocol
    
    init(_ service: LoginServiceProtocol = LoginService(),
         response: Login? = nil)
    {
        self.service  = service
        self.response = response
    }
    
    func isValidated() -> Bool {
        return true
//        let isValidUserName = username.isValidUserName
//        let isValidPassword = password.isValidPassword
//        guard !username.isEmpty, isValidUserName else { return false }
//        guard !password.isEmpty, isValidPassword else { return false }
//        return isValidUserName && isValidPassword
    }
    
    func signIn() {
        guard isValidated() else {
            return
        }
        self.isLoading = true
        service.login(requestParams: builParams()) { [weak self] response, errorr  in
            if errorr == nil, let serverResponse = response {
                self?.response = serverResponse
                self?.isLoading = false
            }else {
                self?.isLoading = false
                self?.hasError  = true
            }
        }
    }
    
    func builParams() -> [String: Any] {
        let params = ["username": username,
                      "password": password]
        return params
    }
    
}
