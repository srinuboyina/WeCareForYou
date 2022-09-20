//
//  CreateProfileServiceTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import XCTest
@testable import WecareForU

final class CreateProfileServiceTests: XCTestCase {

    let service = CreateProfileService()


    func testCreate() {
        service.create(requestParams: [:]) { createProfile, error in
            XCTAssertTrue(error?.errorDescription == "")
        }
    }

}
