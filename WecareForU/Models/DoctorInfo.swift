//
//  DoctorInfo.swift
//  WecareForU
//
//  Created by apple on 5/4/22.
//

import Foundation

// MARK: - Welcome
struct DoctorInfo: Codable {
    var info: [Info]?
    init(info: [Info]?) {
        self.info = info
    }
}

// MARK: - Info
struct Info: Identifiable, Codable {
    var id : String {
        self.name ?? UUID().uuidString
    }
    let name, specializedIn, address, availabilityTime: String?
    let contactDetail: ContactDetail?
    var schedules: [Schedule]?
    var isBusy: Bool {
        if let schedules = schedules,  schedules.count > 5 {
            return true
        }
        return false
    }
    
    init(name: String,
         specializedIn: String,
         address: String,
         availabilityTime: String?,
         contactDetail: ContactDetail?,
         schedules: [Schedule]?
         ) {
        self.name = name
        self.specializedIn = specializedIn
        self.address = address
        self.availabilityTime = availabilityTime
        self.schedules = schedules
        self.contactDetail = contactDetail
        
        
    }
    
    static let example = Info(name: "Dr. Namita Jain", specializedIn: "Cancer Specialist", address: "Sparsh Hospice, Hyderabad", availabilityTime: "10:30 am - 05:00 pm", contactDetail: ContactDetail.example, schedules: [Schedule.example])
}

// MARK: - ContactDetail
struct ContactDetail: Codable {
    let email, phoneNumber, completeAddress: String?
    
    init(email: String,
         phoneNumber: String,
         completeAddress: String) {
        self.email = email
        self.phoneNumber = phoneNumber
        self.completeAddress = completeAddress
    }
    
    static let example = ContactDetail(email: "namitajain@wecare.com", phoneNumber: "+91-9876543210", completeAddress: "123/A, Sparsh hospice, Behind SBI Bank, \nHitec City, Hyderabad, 500019")
}

// MARK: - Schedule
struct Schedule: Identifiable, Codable {
    
    var id : String {
        self.time ?? UUID().uuidString
    }
    let time: String?
    var isAvailable: Bool?
    
    init(time: String,
         isAvailable: Bool) {
        self.time = time
        self.isAvailable = isAvailable
    }
    static let example = Schedule(time: "10:30 am - 05:00 pm", isAvailable: true)

}
