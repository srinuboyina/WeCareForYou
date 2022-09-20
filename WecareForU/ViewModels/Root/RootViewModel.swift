//
//  RootViewModel.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI

internal class RootViewModel: ObservableObject {
    @Published internal var isLanguageChanged = false
    @Published internal var isAuthenticated   = false
    @Published internal var isProfileCompleted   = false
    @Published internal var internetMonitor   = InternetMonitor()
    @Published internal var showToastError = false
    @Published internal var showVersionTostInfo = false
    @Published internal var username = ""
    @Published internal var email = ""
    @Published internal var selectedTab = Tab.Home
    internal var toastMessage: String?
    internal var dropDownData: DropdownData?
    internal var doctorInfo: DoctorInfo?
    // TODO: Remove this - will fetch from backend later
    internal var bookings: [Info]? = [Info]()

    init() {
        dropDownData = Bundle.main.decode(DropdownData.self, from: "dropDown.json")
        doctorInfo = Bundle.main.decode(DoctorInfo.self, from: "doctorsInfo.json")
    }
    
    internal func showToast(_ message: String) {
        if !message.isEmpty {
            toastMessage = message
            showToastError = true
        }
    }

    internal func isBookingsFound() -> Bool {
        if bookings?.isEmpty ?? false {
            return false
        }
        return true
    }
}
