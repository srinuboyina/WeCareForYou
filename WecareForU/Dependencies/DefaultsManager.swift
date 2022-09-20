//
//  DefaultsManager.swift
//  WecareForU
//
//  Created by apple on 4/22/22.
//

import Foundation

enum UserDefaultsKey: String {
    static let keyPrefix = "com.wecare.swiftui.UserDefaults"
    case loggedIn
    case userName
    case hasPresentedOnboarding
    case hasSelectedLanguage

    func defaultKey() -> String {
        return UserDefaultsKey.keyPrefix + "." + self.rawValue
    }
}

protocol DefaultsManager {
    func getDefault(_ key: UserDefaultsKey) -> Bool
    func setDefault(_ key: UserDefaultsKey, value: Bool)

    func getDefault(_ key: UserDefaultsKey) -> String?
    func setDefault(_ key: UserDefaultsKey, value: String)
}

class AppDefaultsManager: DefaultsManager {

    func getDefault(_ key: UserDefaultsKey) -> Bool {
        return UserDefaults.standard.bool(forKey: key.defaultKey())
    }
    
    func setDefault(_ key: UserDefaultsKey, value: Bool) {
        UserDefaults.standard.setValue(value, forKey: key.defaultKey())
    }

    func getDefault(_ key: UserDefaultsKey) -> String? {
        return UserDefaults.standard.string(forKey: key.defaultKey())
    }
    
    func setDefault(_ key: UserDefaultsKey, value: String) {
        UserDefaults.standard.setValue(value, forKey: key.defaultKey())
    }
    
}

//MARK: for testing or for previews
class MockDefaultsManager: DefaultsManager {
    var didGetDefaultBool = false
    var didSetDefaultBool = false
    var didGetDefaultString = false
    var didSetDefaultString = false

    func getDefault(_ key: UserDefaultsKey) -> Bool {
        self.didGetDefaultBool = true
        return false
    }
    
    func setDefault(_ key: UserDefaultsKey, value: Bool) {
        self.didSetDefaultBool = true
    }

    func getDefault(_ key: UserDefaultsKey) -> String? {
        self.didGetDefaultString = true
        return nil
    }
    
    func setDefault(_ key: UserDefaultsKey, value: String) {
        self.didSetDefaultString = true
    }
}
