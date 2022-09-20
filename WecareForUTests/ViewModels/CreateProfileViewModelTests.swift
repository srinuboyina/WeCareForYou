//
//  CreateProfileViewModelTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class CreateProfileViewModelTests: XCTestCase {

    let viewModel: CreateProfileViewModel = CreateProfileViewModel()


    func testModel() throws {
        viewModel.createProfile()
        XCTAssertTrue(viewModel.joiningAs == "")
        XCTAssertTrue(viewModel.contactNo == "")
        XCTAssertTrue(viewModel.ruralOrUrban.count == 0)
        XCTAssertTrue(viewModel.gender.count == 0)
        XCTAssertTrue(viewModel.maritalStatus.count == 0)
        XCTAssertTrue(viewModel.bplCategory.count == 0)
    }

}
