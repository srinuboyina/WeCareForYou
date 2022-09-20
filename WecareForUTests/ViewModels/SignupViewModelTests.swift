//
//  SignupViewModelTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class SignupViewModelTests: XCTestCase {
        
    let viewModel = SignUpViewModel()
    func testPerformanceExample() {
        viewModel.signUp()
        XCTAssertTrue(viewModel.isLoading == true)
        XCTAssertTrue(viewModel.username == "")
    }

}
