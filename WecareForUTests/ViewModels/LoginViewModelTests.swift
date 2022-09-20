//
//  LoginViewModelTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class LoginViewModelTests: XCTestCase {

    let viewModel = LoginViewModel()
    
    func testPerformanceExample() {
        viewModel.signIn()
        XCTAssertTrue(viewModel.isLoading == true)
    }

}
