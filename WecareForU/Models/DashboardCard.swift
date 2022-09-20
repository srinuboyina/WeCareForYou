//
//  DashboardCard.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import Foundation

struct DashboardCard {
    let title: String
    let subTitle: String
    let buttonName: String
    let imageName: String

    static let example = DashboardCard(title: "Patient Registration", subTitle: "Do you need admission? \nPlease go ahead and register.", buttonName: "Register", imageName: "doctorImage")
    static let example2 = DashboardCard(title: "Available Slots", subTitle: "Check available time slots and \nconsult with our experts.", buttonName: "Book Now", imageName: "doctorSlot")

}
