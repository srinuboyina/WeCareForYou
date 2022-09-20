//
//  String+Extension.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 20/04/22.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._`'!#$%&*+-./={|}^~?]+@(?!.*\\.{2})[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if !self.isEmpty && emailTest.evaluate(with: self) {
            let prefixMail = self.components(separatedBy: "@").first ?? ""
            guard let lastChar = Array(prefixMail).last else { return false }
            let userCharacterSet = CharacterSet(charactersIn: String(lastChar))
            let charset = CharacterSet(charactersIn: "._`\"'!#$%&()*+,-./:;<=>{|}^~?\\[\\]\\\\")
            return charset.inverted.isSuperset(of: userCharacterSet)
        } else {
            return false
        }
    }
    
    var isValidUserName: Bool {
        if self.count >= 8 && self.count < 20 {
            let userCharacterSet = CharacterSet(charactersIn: self)
            let charset = CharacterSet(charactersIn: "`\"'!#$%&()*+,-/:;<=>{|}^~?\\[\\]\\\\ABCDEFGHIJKLMNOPQRSTUVWXY@Z")
            return charset.inverted.isSuperset(of: userCharacterSet)
        }
        return false
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
}

// MARK: Localized

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

// MARK: Video - Embed

extension String {
   var embed: String {
       var strings = self.components(separatedBy: "/")
       let videoId = strings.last ?? ""
       strings.removeLast()
       let embedURL = strings.joined(separator: "/") + "embed/\(videoId)"
       return embedURL
   }
}
