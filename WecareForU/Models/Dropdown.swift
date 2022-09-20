//
//  Dropdown.swift
//  WecareForU
//
//  Created by apple on 4/28/22.
//

import Foundation

struct DropdownData: Codable {
    let joiningAs: [DropDownBaseResp]?
    let age      : [DropDownBaseResp]?
    let maritalStatus: [DropDownBaseResp]?
    let gender: [DropDownBaseResp]?
    let ruralOrUrban: [DropDownBaseResp]?
    let bplCategory: [DropDownBaseResp]?
    let annualIncome: [DropDownBaseResp]?
    let reference: [DropDownBaseResp]?
    let occupation: [DropDownBaseResp]?
    let cancerType: [DropDownBaseResp]?
    let education: [DropDownBaseResp]?
    let volunteerInterest: [DropDownBaseResp]?
    let symptoms: [DropDownBaseResp]?
    let diagnosis: [DropDownBaseResp]?
    let nutritionReq: [DropDownBaseResp]?
    var patientAdmitType: [DropDownBaseResp]?
}

// MARK: - Base Resp
struct DropDownBaseResp: Codable {
    let name, id: String?, type: String?
}
