//
//  Font+Custom.swift
//  WecareForU
//
//  Created by apple on 4/20/22.
//

import SwiftUI

extension Font {
    
    enum FontSize: CGFloat {
        case small      = 12
        case small2     = 13
        case medium     = 14
        case large      = 16
        case semiLarge  = 18
        case extraLarge = 20
        case extraLarge2 = 22
        case extraLarge3 = 24
        case logoTitle  = 25
    }
    
    enum Family {
        case semiBold
        case light
        case regular
        case medium
        case bold
        case boldExtra
        case custom(String)
        
        var value: String {
            switch self {
            case .light:
                return "OpenSans-Light"
            case .regular:
                return "OpenSans-Regular"
            case .medium:
                return "OpenSans-Medium"
            case .bold:
                return "OpenSans-Bold"
            case .semiBold:
                return "OpenSans-SemiBold"
            case .boldExtra:
                return "OpenSans-ExtraBold"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func fontWith(_ type: Family, size: FontSize = FontSize(rawValue: 14.0)!) -> Font {
        return .custom(type.value, size: size.rawValue)
    }
    
}
