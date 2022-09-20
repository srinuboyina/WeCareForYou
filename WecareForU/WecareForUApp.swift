//
//  WecareForUApp.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 19/04/22.
//

import SwiftUI


@main
struct WecareForUApp: App {
    
    @StateObject var rootView = RootViewModel()
    @StateObject var settingView = LanguageSettings(defaultLanguage: .en)
    var body: some Scene {
        WindowGroup {
            AppRootView().environmentObject(rootView)
        }
    }
}
