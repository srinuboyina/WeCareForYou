//
//  SignupServiceTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class SignupServiceTests: XCTestCase {
    
    let service = SignUpService()


    func testSignUp()  {
        service.signUp(requestParams: [:]) { signup, error in
            XCTAssertTrue(error?.errorDescription == "")
        }
    }

}
