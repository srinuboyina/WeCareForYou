//
//  Constants.swift
//  WecareForU
//
//  Created by apple on 4/21/22.
//

import SwiftUI

struct Constants {
    
    struct Size {
        static let topLogoHeight: CGFloat = 245
        static let iconHeight   : CGFloat = 25
    }
    struct DropDown {
        static var scrollHeight : CGFloat = 110
    }
    
    struct EnquiryView {
        static var viewWidthAndHeight = UIScreen.main.bounds.width-60
        static var sectionSize: CGFloat {
            return viewWidthAndHeight/2
        }
        static var tileSize: CGFloat {
            return sectionSize - 40
        }
        static var radius: CGFloat {
            return tileSize*0.2 // 20% of tile size
        }
    }
    struct Url {
        static let faq = "https://www.sparshhospice.org/donate/faqs/"

    }
}

public enum Spacing {
    public static let tinyX: CGFloat = 4 // Extra tiny
    public static let tiny: CGFloat = 6
    public static let small: CGFloat = 8
    public static let medium: CGFloat = 12
    public static let mediumL: CGFloat = 16 // Medium large
    public static let large: CGFloat = 28
    public static let larger: CGFloat = 45
    public static let largeX: CGFloat = 64 // Extra large
    public static let buttonBottomMargin: CGFloat = 27
}


//MARK: - File where you enum your keys to your Localized file
enum ButtonName: LocalizedStringKey {
    case SignIn
    case SignUp
    case LogIn
}

enum LabelName: LocalizedStringKey {
    case email
    case password
    case joiningAs
}
