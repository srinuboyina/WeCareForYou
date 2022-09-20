//
//  Color+Assets.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

extension Color {
    
    static let appPrimary      = getColor("appPrimary")
    static let appDarkGrey     = getColor("appDarkGrey")
    static let appSecondary    = getColor("appSecondary")
    static let appBg           = getColor("appBg")
    static let appLabelColor   = getColor("appLabelColor")
    
    static let themeBlueColor   = getColor("themeBlue")
    static let themeLightColor   = getColor("themeLight")

    struct TextField {
        static let lightShadow = getColor("lightShadow")
        static let darkShadow  = getColor("darkShadow")
        static let background  = getColor("background")
        static let textColor   = getColor("textColor")
        static let topLabel   = getColor("topLabel")
    }
    
    static func getColor(_ name: String) -> Color {
        return Color(name)
    }
    
}

extension UIColor {
    static let appPrimary      = UIColor(named: "appPrimary") ?? UIColor.blue
}
