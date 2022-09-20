//
//  ForgotPasswordViewModelTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class ForgotPasswordViewModelTests: XCTestCase {

    let viewModel = ForgotPasswordViewModel()

    func testVerificationMail()  {
        viewModel.sentVerificationEmail()
        XCTAssertTrue(viewModel.isLoading == false)
        XCTAssertTrue(viewModel.username == "")
    }

}
