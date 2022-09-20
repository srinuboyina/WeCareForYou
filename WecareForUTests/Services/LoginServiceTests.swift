//
//  LoginServiceTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class LoginServiceTests: XCTestCase {
    
    let service: LoginService = LoginService()
  
    func testLogin() throws {
        service.login(requestParams: ["":""]) { login, error in
            XCTAssertTrue(login?.userName == "")
        }
    }

}
