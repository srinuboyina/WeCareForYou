//
//  ForgotPasswordServiceTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class ForgotPasswordServiceTests: XCTestCase {
    
    let service = ForgotPasswordService()

    func testVerificationLink() {
        service.sendVerificationLink(requestParams: [:]) { forgotPassword, error in
        }
    }

}
