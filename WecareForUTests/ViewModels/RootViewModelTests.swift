//
//  RootViewModelTests.swift
//  WecareForUTests
//
//  Created by apple on 11/09/22.
//

import Foundation
@testable import WecareForU
import XCTest


class RootViewModelTests: XCTestCase {
        
    let viewModel:RootViewModel = RootViewModel()
    
    func testModel() {
        XCTAssert(!viewModel.isAuthenticated, "authentication successful")
        XCTAssert(!viewModel.isLanguageChanged, "Language changed")
        XCTAssert(!viewModel.isProfileCompleted, "Language changed")
        XCTAssert(!viewModel.showToastError, "Language changed")
        XCTAssert(!viewModel.showVersionTostInfo, "Language changed")
    }
    
    func testToastMessage() {
        viewModel.showToast("message")
        XCTAssert(viewModel.showToastError, "Show toast error")
    }
    
    func testIsBookingsFound() {
        XCTAssert(!viewModel.isBookingsFound(), "booking not found")
    }
}
